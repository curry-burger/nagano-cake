class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:customer_notice] = "会員情報を更新しました"
      redirect_to customers_my_page_path
    else
      render "edit"
    end
  end

  def confirm
  end

  def exit

  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name,:last_name_kana,:first_name_kana,:email,:password,:post_code,:address,:phone_number)
  end

end
