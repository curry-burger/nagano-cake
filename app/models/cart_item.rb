class CartItem < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  belongs_to :item

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * count
  end


  def self.total_price(customer)
    CartItem.where(customer_id: customer.id).inject(0){|sum, cart_item| sum + cart_item.subtotal}
  end

end
