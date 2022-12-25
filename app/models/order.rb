class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum pay_method: {credit_card: 0, transfer: 1}
  enum status: {waiting: 0, confirmation: 1, production: 2, preparing: 3 , shipped: 4}

  def address_display
    '〒' + post_code + ' ' + address
  end

end
