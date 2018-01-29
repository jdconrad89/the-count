class Recipe < ApplicationRecord
  validates :name, :description, presence: true

  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :meals, through: :meal_recipes
end
