class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true
      t.decimal :value, precision: 8, scale: 2
      t.string :source
      t.string :description

      t.timestamps
    end
  end
end
