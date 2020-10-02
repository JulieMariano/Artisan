class CreateOrdersItems < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
