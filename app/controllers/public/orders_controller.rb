class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order=Order.new
    @customer=current_customer
    @addresses=@customer.addresses
  end

  def confirm
    @order=Order.new(order_params)
    if params[:order][:select_address]=='0'
      @order.post_code=current_customer.post_code
      @order.name=current_customer.last_name+current_customer.first_name
      @order.address=current_customer.address
    elsif params[:order][:select_address]=='1'
      @address=Address.find(params[:order][:address_id])
      @order.post_code=@address.post_code
      @order.name=@address.name
      @order.address=@address.address
    elsif params[:order][:select_address]=='2'
      @order.customer_id=current_customer.id
    end
    @cart_items=current_customer.cart_items.all
    @total_price = CartItem.total_price(current_customer)
    @order_new=Order.new
    render :confirm
  end

  def create
    @order=Order.new(order_params)
    @order.save
    @cart_items=current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_items=OrderItem.new
      @order_items.order_id=@order.id
      @order_items.item_id=cart_item.item.id
      @order_items.price=cart_item.item.with_tax_price
      @order_items.count=cart_item.count
      @order_items.status=0
      @order_items.save!
    end

    CartItem.destroy_all
    redirect_to "/orders/complete"
  end

  def complete
  end

  def index
    @customer=current_customer
    @orders=@customer.orders.page(params[:page])
  end

  def show
    @order=Order.find(params[:id])
    @total_price = OrderItem.total_price(@order)
    @order_items=OrderItem.where(order_id:params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:status,:name,:post_code,:address,:postage,:pay_total,:pay_method)
  end

end