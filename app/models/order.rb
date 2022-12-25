class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  # 0:クレジットカード, 1:銀行振込
  enum pay_method: {credit_card: 0, transfer: 1}

  # 0:入金待ち, 1:入金確認, 2:製作中, 3:発送準備中, 4:発送済み
  enum status: {waiting: 0, confirmation: 1, production: 2, preparing: 3, shipped: 4}

  def address_display
    '〒' + post_code + ' ' + address
  end

end
