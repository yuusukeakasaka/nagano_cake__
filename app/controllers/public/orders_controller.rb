class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = current_customer.addresses
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment,:postage,:status)
  end


end
