class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end

end
