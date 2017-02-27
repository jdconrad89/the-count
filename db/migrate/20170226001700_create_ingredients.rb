class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string  :name
      t.string  :brand
      t.integer :calories
      t.integer :fat

      t.timestamps
    end
  end
end
