class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :postage, null: false
      t.integer :pay_total, null: false
      t.integer :pay_method, null: false, default: 0
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :status, null: false, default: 0


      t.timestamps
    end
  end
end
