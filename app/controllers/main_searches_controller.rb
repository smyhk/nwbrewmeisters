class MainSearchesController < ApplicationController

  def search
    @articles = Article.ransack(params[:p].result(distinct: true))
    render json: { articles: [], recpes: [] }
  end

end
