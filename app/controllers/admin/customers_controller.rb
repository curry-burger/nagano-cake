class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @customer = Customer.all.order(id: "DESC")
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
  def exit
    @customer = Customer.find(params[:id])
    # id_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(id_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :post_code, :address, :phone_number, :email, :id_deleted, :first_name_kana)
  end


end