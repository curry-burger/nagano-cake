class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path(cart_item)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
    if item
      item.update(quantity: item.quantity.to_i + params[:cart_item][:quantity].to_i)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :count)
  end

end
