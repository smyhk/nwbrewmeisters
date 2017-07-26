class RecipesController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]

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
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update_attributes(recipe_params)
      #handle a successful update
      flash[:success] = "Recipe updated"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user || current_user.admin?
      @recipe.destroy
    end
    flash[:success] = "Recipe deleted"
    redirect_to current_user
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :description)
    end

    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to root_url if @recipe.nil?
    end

end
