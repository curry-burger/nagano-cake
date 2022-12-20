class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # itemsテーブルのストロングパラメーター
  # private
  # def item_params
  #   params.require(:item).permit(:name, :description, :price, :status, :item_image)
  # end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name,:last_name_kana,:first_name_kana,:email,:password,:post_code,:address,:phone_number])
  end
end
