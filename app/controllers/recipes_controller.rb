class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to profile_path, sucess: "You have successfully created a recipe! Let's get started on adding some ingredients!"
    else
      redirect_to new_recipe_path, danger: "Missing information for your recipe please try again."
    end
  end

  def show
    @recipe = found_recipe
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

  def found_recipe
    Recipe.find(params[:id])
  end
end
