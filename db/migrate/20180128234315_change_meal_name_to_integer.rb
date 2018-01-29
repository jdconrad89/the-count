class ChangeMealNameToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :meals, :name, :integer, default: 0
  end
end
