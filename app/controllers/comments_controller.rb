class CommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :admin_user,     only: [:destroy]

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
