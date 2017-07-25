class ArticlesController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to current_user
    else
      @feed_items = []
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update_attributes(article_params)
      #handle a successful update
      flash[:success] = "Article updated."
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user == current_user || current_user.admin?
      @article.destroy
    end
    flash[:success] = "Article deleted"
    redirect_to current_user
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url if @article.nil?
    end

end
