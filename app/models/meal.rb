class Meal < ApplicationRecord
  validates :name, :date, presence: true

  belongs_to :user
  has_many   :meal_ingredients
  has_many   :ingredients, through: :meal_ingredients
  has_many   :recipes, through: :meal_recipes

  enum name: %w(breakfast lunch dinner dessert snack)
end
