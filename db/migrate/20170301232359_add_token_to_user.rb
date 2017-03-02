class AddTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token, :text
  end
end
