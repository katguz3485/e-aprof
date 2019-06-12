# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment, only: %i[destroy]
  before_action :commentable, only: %i[new create]

  def create
    comment = commentable.comments.new(comment_params.merge(user: current_user))
    if comment.save
      redirect_to request.referer, notice: I18n.t('shared.created', resource: 'Comment')
    else
      flash.now.alert = I18n.t('shared.error_create')
      render :new
    end
  end

  def show
    commentable.comments
  end

  def destroy
    commentable
    if comment.attributes.has_value?(current_user.id)
      comment.destroy
      redirect_to request.referer, notice: I18n.t('shared.deleted', resource: 'Comment')
    else
      redirect_to request.referer, notice: I18n.t('shared.restricted')
    end
  end

  private

  def comment
    @comment = Comments::CommentsQuery.find_comment(params[:id])
  end

  def commentable
    @commentable = Comments::CommentsQuery.find_commentable(request)
  end

  def comment_params
    params.require(:comment).permit(:title, :description)
  end
end
