class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:add, :buy_one]

  def add
    if current_user.nil?
      redirect_to new_user_session_path
      flash[:alert] = 'You need to sign in or sign up before continuing'

    else
      @item = Item.find(params[:item_id])

      @order = current_user.cart
      @order = Order.create(user: current_user, state: 'pending') if @order.nil?

      order_item = @order.order_items.find_by(item: @item)

      if order_item.nil?
        OrderItem.create(order: @order, item: @item, quantity: 1)
      else
        order_item.increment!(:quantity)
      end
    end
  end

  def buy_one
    if current_user.nil?
      redirect_to new_user_session_path
      flash[:alert] = 'You need to sign in or sign up before continuing'

    else
      item = Item.find(params[:item_id])
      @order = Order.new(user: current_user, state: 'paying')

      if @order.save
        OrderItem.create(order: @order, item: item, quantity: 1)
        @order_items = @order.order_items

        create_stripe_session(@order, @order_items)
      end
    end
  end

  def buy_all
    @order = current_user.orders.find(params[:order_id])
    @order_items = @order.order_items.order(created_at: :desc)

    create_stripe_session(@order, @order_items)
  end

  def index
    @order = current_user.cart
    @order = Order.create(user: current_user, state: 'pending') if @order.nil?

    @order_items = @order.order_items.order(created_at: :desc)

    @paid_orders = current_user.paid_orders.paginate(page: params[:page], per_page: 5)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items.order(created_at: :desc)
  end

  private

  def create_stripe_session(order, order_items)
    items_data = order_items.map do |order_item|
      { name: order_item.item.sku,
        images: [Cloudinary::Utils.cloudinary_url(order_item.item.picture.key)],
        amount: order_item.item.price_cents,
        currency: 'eur',
        quantity: order_item.quantity
      }
    end

    items_data << get_shipping(order)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: items_data,
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
  end

  def get_shipping(order)
    order.update(shipping_costs: order.calculate_shipping_costs)

    { name: 'shipping',
      images: ['https://res.cloudinary.com/dvvuknsmw/image/upload/v1601052205/delivery-truck-icon-vector-21679802_kgvquc.jpg'],
      amount: order.shipping_costs_cents,
      currency: 'eur',
      quantity: 1
    }
  end
end
