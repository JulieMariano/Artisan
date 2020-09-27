class StripeCheckoutSessionService
  # Update the Order's state to 'paid'
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid', payment_date: DateTime.now)

    # Schedule the delivery to be made 3 days after the payment, using a Background Job
    DeliveryJob.set(wait: 3.days).perform_later(order.id)
  end
end
