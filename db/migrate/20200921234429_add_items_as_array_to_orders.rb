class AddItemsAsArrayToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :items, :text, array: true, default: []
  end
end
