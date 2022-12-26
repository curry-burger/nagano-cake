class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.status == "confirmation"
        @order.order_items.update_all(status:1)
      end
      redirect_to request.referer
    else
      render "show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
