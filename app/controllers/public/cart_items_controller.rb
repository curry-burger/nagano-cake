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
    # item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
    # if item
    #   item.update(quantity: item.quantity.to_i + params[:cart_item][:quantity].to_i)
    # else
    #   cart_item = CartItem.new(cart_item_params)
    #   cart_item.customer_id = current_customer.id
    #   cart_item.save
    # end
    #   redirect_to cart_items_path
    
    # if current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    #   #数量が選択されていない場合
    #   if cart_item_params[:count].blank?
    #     @item = Item.find(cart_item_params[:item_id])
    #     @genres = Genre.all
    #     @cart_item = CartItem.new
    #     flash[:notice] = "個数を入力してください"
    #     redirect_to item_path(@item.id)
    #   #数量が選択されている場合  
    #   else
    #     @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    #     @cart_item.count = @cart_item.count + cart_item_params[:count].to_i
    #     @cart_item.save
    #     redirect_to cart_items_path
    #   end
    # else
    #   # 数量が選択されていない場合
    #   if cart_item_params[:count].blank?
    #     @item = Item.find(cart_item_params[:item_id])
    #     @genres = Genre.all
    #     @cart_item = CartItem.new
    #     flash[:notice] = "個数を入力してください"
    #     redirect_to item_path(@item.id)
    #   #数量が選択されている場合  
    #   else
    #     @cart_item = current_customer.cart_items.new(cart_item_params)
    #     @cart_item.save
    #     redirect_to cart_items_path
    #   end
    # end
    
    # @cart_item = current_customer.cart_items.new(cart_item_params)
    # @cart_item = CartItem.new
    # @total_price = 0
    #選択されていない場合 
    # if params[:cart_item][:count].empty?
    #   flash[:notice] = "個数を選択してください"
    #   redirect_to request.referer
    # elsif current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    #   cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #   cart_item.count += params[:cart_item][:count].to_i
    #   cart_item.save
    #   redirect_to cart_items_path
    # else
    #   @cart_item.save
    #   redirect_to cart_items_path
    # end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :count)
  end

end
