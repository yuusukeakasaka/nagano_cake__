class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @address = current_customer.addresses
  end
  
end
