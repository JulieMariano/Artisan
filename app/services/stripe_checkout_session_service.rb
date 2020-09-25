class StripeCheckoutSessionService
  # Update the Order's state to 'paid'
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid', payment_date: DateTime.now)
  end
end
