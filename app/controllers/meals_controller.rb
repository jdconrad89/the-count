class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.create(meal_params)
    @meal.user_id = current_user.id
    if @recipe.save
      redirect_to meals_path, success: "Looks like someone was hungry, what did you eat?"
    else
      redirect_to new_meal_path, danger: "Missing information for this meal please try again."
    end
  end

  def show
    @meal = found_meal
  end

  def index
    @meals = current_user.meals
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :date)
  end

  def found_meal
    Meal.find(params[:id])
  end

end
