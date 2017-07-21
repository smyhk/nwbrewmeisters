class CorePagesController < ApplicationController
  def about
  end

  def contact
  end

  def home
    @articles = Article.all
    @feed_items = @articles.paginate(page: params[:page])
  end
end
