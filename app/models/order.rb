class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum pay_method: {credit_card: 0, transfer: 1}
  enum order_status: {waiting: 0, confirmation: 1, production: 2, preparing: 3 , shipped: 4}

  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end

end
