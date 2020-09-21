class OrdersController < ApplicationController
  def add
    @item = Item.find(params[:item_id])
    @order = Order.create(item: @item,
                          user: current_user,
                          state: 'pending'
                         )
  end

  def buy
    @item = Item.find(params[:item_id])
    @order = Order.new(item: @item,
                       user: current_user,
                       state: 'pending'
                      )

    if @order.save
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

  def index
    @user = current_user
    @total = @user.pending_orders.map {|order| order.item.price}.sum
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end
end
