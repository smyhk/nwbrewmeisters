class MainSearchesController < ApplicationController

  def search
    @articles = Article.ransack(title_cont: params[:q]).result(distinct: true)
    @recipes  = Recipe.ransack(name_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @articles = @articles.limit(5)
        @recipes  = @recipes.limit(5)
      }
    end
  end

end
