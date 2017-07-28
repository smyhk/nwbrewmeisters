class MainSearchesController < ApplicationController

  def search
    @articles = Article.ransack(params[:p].result(distinct: true))
    @recipes  = Recipe.ransack(params[:p].result(distinct: true))
  end

end
