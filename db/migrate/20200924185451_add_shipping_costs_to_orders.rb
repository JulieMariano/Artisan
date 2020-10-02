class AddShippingCostsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_monetize :orders, :shipping_costs, currency: { present: false }
  end
end
