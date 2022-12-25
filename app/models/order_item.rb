class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :items
  enum status: {can_not_start: 0, waiting_for_production: 1, production: 2, completed: 3}

  def sub_total
    count*product.with_tax_price
  end

  def self.total_price(order)
    OrderItem.where(order_id: order.id).inject(0){|sum, order_detail| sum + order_detail.sub_total}
  end

end
# 0: 着手不可, 1:製作待ち, 2: 製作中, 3: 製作完了