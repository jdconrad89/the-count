class CreateMealRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_recipes do |t|
      t.references :recipe, foreign_key: true
      t.references :meal,   foreign_key: true
    end
  end
end
