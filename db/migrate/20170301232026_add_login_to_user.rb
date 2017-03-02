class AddLoginToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :social_login, :boolean, default: false
  end
end
