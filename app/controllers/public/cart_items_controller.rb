class Public::CartItemsController < ApplicationController

  def index
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_item_path(@cart_item.id)
  end

  def destroy
  end


  def create
    @cart_item = CartItem.new
    @cart_item.save
    redirect_to cart_items_path(@cart_item.id)
  end



end
