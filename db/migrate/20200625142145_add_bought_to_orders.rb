class AddBoughtToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :bought, :boolean, default: false
  end
end
