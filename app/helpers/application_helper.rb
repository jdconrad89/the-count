module ApplicationHelper
  def logged_in?
    !current_user.nil?
  end

  def recipes?
    current_user.recipes.count == 0
  end

  def recipe_directions(recipe)
    if recipe.directions.nil?
      "Enter your directions here!"
    else
      "#{recipe.directions}"
    end
  end

  def recipe_count
    current_user.recipes.count
  end

  def has_ingredients?(recipe)
    recipe.ingredients.nil?
  end

end
