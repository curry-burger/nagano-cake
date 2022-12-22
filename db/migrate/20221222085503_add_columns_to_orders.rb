class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :customer_id, :integer, null: false
  end
end
