class AddItemsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :items, :text
  end
end
