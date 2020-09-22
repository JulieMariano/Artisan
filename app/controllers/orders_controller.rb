class OrdersController < ApplicationController
  def add
    @item = Item.find(params[:item_id])

    @order = current_user.pending_order
    @order = Order.create(user: current_user, state: 'pending') if @order.nil? 

    OrdersItem.create(order: @order,
                      item: @item,
                      quantity: 1
                     )
  end

  def buy_one
    @item = Item.find(params[:item_id])
    @order = Order.new(user: current_user, state: 'paying')

    if @order.save
      OrdersItem.create(order: @order,
                        item: @item,
                        quantity: 1
                       )

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @item.sku,
          images: [Cloudinary::Utils.cloudinary_url(@item.picture.key)],
          amount: @item.price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      )

      @order.update(checkout_session_id: session.id)

      redirect_to new_order_payment_path(@order)
    end
  end

  def buy_all
    @order = current_user.pending_order

    items_data = @order.orders_items.map do |order_item|
      {
        name: order_item.item.sku,
        images: [Cloudinary::Utils.cloudinary_url(order_item.item.picture.key)],
        amount: order_item.item.price_cents,
        currency: 'eur',
        quantity: order_item.quantity
      }
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: items_data,
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    redirect_to new_order_payment_path(@order)
  end

  def index
  end
end
