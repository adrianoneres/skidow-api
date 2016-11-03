class ChangeUserModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password_salt, :string
    add_column :users, :name, :string
  end
end
