class AddServingSizeToIngredient < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :serving_size, :integer
  end
end
