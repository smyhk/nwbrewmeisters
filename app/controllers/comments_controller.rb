class CommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  # before_action :correct_user,   only: [:edit, :update, :destroy]

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user || current_user.admin?
      @comment.destroy
    end
    flash[:success] = "Comment deleted"
    redirect_to @commentable
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
