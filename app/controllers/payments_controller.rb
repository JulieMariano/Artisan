class PaymentsController < ApplicationController
  def new
    @order = current_user.pending_order
  end
end
