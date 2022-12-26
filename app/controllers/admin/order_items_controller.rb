class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if @order_item.status == "production"
      @order.update(status: 2)
    elsif OrderItem.where(status: "completed", order_id: @order_item.order_id).count == @order.order_items.count
      @order.update(status: 3)
    end
    redirect_to request.referer
  end

  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end

end