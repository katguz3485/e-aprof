class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[destroy]
  before_action :load_commentable, only: %i[index, new, create]


  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # redirect_to [@commentable, :comments], notice: "Your comment was successfully posted."
    redirect_to @commentable, notice: "Your comment was successfully posted."
  end


  def show
    @comments = @commentable.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    @comment.destroy
    if @comment.destroy
      redirect_to @commentable, notice: "Comment deleted."
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:title, :description)
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end