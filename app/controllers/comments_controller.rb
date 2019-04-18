class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[destroy]
  before_action :load_commentable, only: %i[index, new, create, destroy]


  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: I18n.t('shared.created', resource: 'Comment')
  end


  def show
    @comments = @commentable.comments
  end

  def destroy
    if current_user.id == @comment.user.id
      @comment.destroy
      redirect_to @commentable, notice: I18n.t('shared.deleted', resource: 'Comment')
    else
      redirect_to @commentable, notice: I18n.t('shared.restricted')

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
