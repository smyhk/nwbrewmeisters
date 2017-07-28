class MainSearchesController < ApplicationController

  before_action :force_json, only: :search

  def search
    @articles = Article.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
    @recipes  = Recipe.ransack(name_cont: params[:q]).result(distinct: true).limit(5)
  end

  private

    def force_json
      request.format = :json
    end

end
