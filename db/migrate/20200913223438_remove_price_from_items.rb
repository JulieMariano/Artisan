class RemovePriceFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :price
  end
end
