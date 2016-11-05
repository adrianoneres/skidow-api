class AddUserToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :sender_id, :integer
  end
end
