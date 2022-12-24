class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
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
    if cart_item_params[:count].empty?
      flash[:alert] = "個数を選択してください"
      redirect_to request.referer
    else
    customer = current_customer
    item = customer.cart_items.find_by(item_id: cart_item_params[:item_id])
      if item.present?
        item.update(count: item.count + cart_item_params[:count].to_i)
        item.save
        redirect_to cart_items_path
      else
        cart_item = CartItem.new(cart_item_params)
        cart_item.customer_id = customer.id
        cart_item.save
        redirect_to cart_items_path
      end
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :count)
  end

end
