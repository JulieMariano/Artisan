class RemoveBoughtFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :bought
  end
end
