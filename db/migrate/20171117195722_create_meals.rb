class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.integer  :name, default: 0
      t.date     :date
    end
  end
end
