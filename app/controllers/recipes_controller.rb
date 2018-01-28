class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, sucess: "You have successfully created a recipe! Let's get started on adding some ingredients!"
    else
      redirect_to new_recipe_path, danger: "Missing information for your recipe please try again."
    end
  end

  def show
    @recipe = found_recipe
  end

  def update
    if params.include?(:food_name)
      update_ingredients
    else
      update_recipe_information
    end
  end

  def index
    @recipes = current_user.recipes
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :directions)
  end

  def found_recipe
    Recipe.find(params[:id])
  end

  def update_recipe
    redirect_to recipe_path(@recipe.id),
    success: "You successfully updated #{@recipe.name}!"
  end

  def fail_to_update
    redirect_to recipe_path(@recipe.slug),
    danger: "Failed to update #{@recipe.name}!"
  end

  def update_recipe_information
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    if @recipe.save
      update_recipe
    else
      fail_to_update
    end
  end

  def update_ingredients
    @ingredient              = Ingredient.find_or_create_by(name: params[:food_name])
    @ingredient.brand        = params[:food_brand]
    @ingredient.calories     = params[:food_calories]
    @ingredient.fat          = params[:food_fat]
    @ingredient.serving_size = params[:food_serving]
    if @ingredient.save
      params[:ingredients] = @ingredient
      update_recipe_ingredients
    else
      fail_to_update
    end
  end

  def update_recipe_ingredients
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients << params[:ingredients]
    if @recipe.save
      update_recipe
    else
      fail_to_update
    end
  end
end
