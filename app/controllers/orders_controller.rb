class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:add, :buy_one]

  def add
    # Make sure the user is logged in
    if current_user.nil?
      redirect_to new_user_session_path
      flash[:alert] = 'You need to sign in or sign up before continuing'

    else
      @item = Item.find(params[:item_id])

      # Get the users' cart; if it doesn't exist, create a new one
      @order = current_user.cart
      @order = Order.create(user: current_user, state: 'pending') if @order.nil?

      order_item = @order.order_items.find_by(item: @item)

      # Add the Item to the cart; if it already exists, increase its quantity by one unit
      if order_item.nil?
        OrderItem.create(order: @order, item: @item, quantity: 1)
      else
        order_item.increment!(:quantity)
      end
    end
  end

  def buy_one
    # Make sure the user is logged in
    if current_user.nil?
      redirect_to new_user_session_path
      flash[:alert] = 'You need to sign in or sign up before continuing'

    else
      item = Item.find(params[:item_id])
      @order = Order.new(user: current_user, state: 'paying')

      # Create a new payment session for one unit of the selected Item
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

    # Create a new payment session for all the Items in the cart
    create_stripe_session(@order, @order_items)
  end

  def index
    # There can only be one Order with the 'pending' state (the cart)
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

  # Method that creates a new payment session for the selected Order
  def create_stripe_session(order, order_items)
    # Information of the Items to be bought
    items_data = order_items.map do |order_item|
      { name: order_item.item.sku,
        images: [Cloudinary::Utils.cloudinary_url(order_item.item.picture.key)],
        amount: order_item.item.price_cents,
        currency: 'eur',
        quantity: order_item.quantity
      }
    end

    # Shipping costs are also considered a Item to be bought
    items_data << get_shipping(order)

    # Create a payment session with the Items information
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: items_data,
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
  end

  # Method that returns the information of the shipping costs fot the selected order
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
