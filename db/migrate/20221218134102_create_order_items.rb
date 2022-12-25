class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.timestamps
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :count ,null: false
      t.integer :status ,null: false ,default:0
      t.integer :price ,null: false
    end
  end
end
