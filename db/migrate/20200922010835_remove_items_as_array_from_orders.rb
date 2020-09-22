class RemoveItemsAsArrayFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :items
  end
end
