class AddPaymentDateToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :payment_date, :datetime
  end
end
