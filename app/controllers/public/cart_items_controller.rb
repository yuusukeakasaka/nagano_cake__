class Public::CartItemsController < ApplicationController

  def index
  end

  def update
  end

  def destroy
  end


  def create
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

end
