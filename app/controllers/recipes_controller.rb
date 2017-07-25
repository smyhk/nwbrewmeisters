class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe saved!"
      redirect_to @recipe
    else
      render 'new'
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :description)
    end

end
