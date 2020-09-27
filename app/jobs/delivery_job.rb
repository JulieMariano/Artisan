class DeliveryJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    Order.find(order_id).update(delivery_date: DateTime.now, state: 'delivered')
  end
end
