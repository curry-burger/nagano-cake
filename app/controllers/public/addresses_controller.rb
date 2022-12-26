class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @address=Address.new
    @addresses=current_customer.addresses.all
  end

  def create
    @address=current_customer.addresses.new(address_params)
    @address.save
    redirect_to request.referer
  end

  def edit
    @address=Address.find(params[:id])
  end

  def update
    @address=Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def address_params
     params.require(:address).permit(:post_code,:address,:name)
  end

end