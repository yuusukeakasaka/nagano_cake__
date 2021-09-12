class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @address = current_customer.addresses.all
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
      @orders = current_customer.orders
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
      @billing = @total + 800
      @order.total_payment = @billing

      if params[:order][:address_number] == "1"
         @order.postal_code = current_customer.postal_code
         @order.address = current_customer.address
         @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:address_number] == "2"
         @order.postal_code = Address.find(params[:order][:address_id]).postal_code
         @order.address = Address.find(params[:order][:address_id]).address
         @order.name = Address.find(params[:order][:address_id]).name
      elsif params[:order][:address_number] == "3"
         @order.postal_code = params[:order][:postal_code]
         @order.address = params[:order][:address]
         @order.name = params[:order][:name]
         if @address.save
            @order.address = @address.address
            @order.name = @address.name
            @order.postal_code = @address.postal_code
         else
            render :new
         end
      end
  end

  def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save
        @cart_items = current_customer.cart_items
        @cart_items.each do |cart_item|
            @order_detail = OrderDetail.new
            @order_detail.item_id = cart_item.item.id
            @order_detail.order_id = @order.id
            @order_detail.price = cart_item.item.price
            @order_detail.amount = cart_item.amount
            @order_detail.save
        end
        @cart_items.destroy_all
        redirect_to orders_thanks_path
  end


  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment,:postage,:status)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end

end
