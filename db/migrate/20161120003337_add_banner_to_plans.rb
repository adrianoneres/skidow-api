class AddBannerToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :banner, :string
  end
end
