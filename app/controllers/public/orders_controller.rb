class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer=current_customer
    @shipping_addresses=@customer
  end

  def confirm

  end

  def create

  end

  def complete
  end

  def index
  end

  def show

  end

  private

  def order_params

  end

end
