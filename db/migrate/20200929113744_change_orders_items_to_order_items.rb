class ChangeOrdersItemsToOrderItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :orders_items, :order_items
  end
end
