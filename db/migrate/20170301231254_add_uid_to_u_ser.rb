class AddUidToUSer < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :integer, limit: 8
  end
end
