class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
  end

  def update
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path(@address.id)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end


end
