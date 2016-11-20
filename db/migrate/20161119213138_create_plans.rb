class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.references :user, foreign_key: true
      t.string :gender
      t.string :age
      t.string :land
      t.string :period

      t.timestamps
    end
  end
end
