class CreateMealIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_ingredients do |t|
      t.references :ingredient, foreign_key: true
      t.references :meal,       foreign_key: true
    end
  end
end
