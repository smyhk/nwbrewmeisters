class MainSearchesController < ApplicationController

  before_action :force_json, only: :search

  def search
    @articles = Article.ransack(params[:p]).result(distinct: true)
    @recipes  = Recipe.ransack(params[:p]).result(distinct: true)
  end

  private

    def force_json
      request.format = :json
    end

end
