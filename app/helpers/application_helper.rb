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

  def total_calories(recipe)
    calories = []
    recipe.ingredients.each do |ingredient|
      calories << ingredient.calories
    end
    calories.reduce(:+)
  end

  def total_fat(recipe)
    fat = []
    recipe.ingredients.each do |ingredient|
      fat << ingredient.fat
    end
    fat.reduce(:+)
  end

  def missing_avatar?
    current_user.avatar.nil? || current_user.avatar.empty?
  end

end
