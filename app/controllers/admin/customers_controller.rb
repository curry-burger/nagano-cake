class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @customer = Customer.all
    @customers = @customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      redirect_to request.referer
      # render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :post_code, :address, :phone_number, :email, :id_deleted)
  end


end