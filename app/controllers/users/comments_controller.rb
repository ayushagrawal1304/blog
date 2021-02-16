class Users::CommentsController < ApplicationController
  def create
    @comment= current_user.comments.new(comment_params)
    params[:commentable_id].present? ? set_commentable(params[:commentable_id], 'Comment') : set_commentable(params[:post_id], 'Post')
    @comment.save!
  end

  private

  def set_commentable(id, type)
    @comment.commentable_id = id
    @comment.commentable_type = type
  end

  def comment_params
    params.permit(:description)
  end
end
