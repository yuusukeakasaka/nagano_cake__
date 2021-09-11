class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @address = current_customer.addresses.all
  end

  def confirm
      @orders = current_customer.orders
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
      @billing = @total + 800

      if params[:order][:address_number] == "1"
         @order.postal_code = current_customer.postal_code
         @order.address = current_customer.address
         @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:address_number] == "2"
         customer_address = Address.find(params[:order][:addresses_id])
         @order.postal_code = customer_address.postal_code
         @order.address = customer_address.address
         @order.name = customer_address.name
      elsif params[:order][:address_number] == "3"
         @order.postal_code = params[:order][:postal_code]
         @order.address = params[:order][:address]
         @order.name = params[:order][:name]
      end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment,:postage,:status)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end

end
