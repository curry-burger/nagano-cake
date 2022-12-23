class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderDetail.find(params[:id])
    @order_item.update(order_item_params)
    if @order_item.making_status == "production"
      @order_item.order.update(order_status: 2)
    elsif OrderItem.where(making_status: "completed", order_id: @order_item.order_id).count == @order_item.order.order_items.count
      @order_item.order.update(order_status: 3)
    end
    redirect_to request.referer
  end

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end