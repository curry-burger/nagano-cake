class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string :post_code ,null: false
      t.string :address ,null: false
      t.string :name ,null: false
      t.datetime :created_at ,null: false
      t.datetime :updated_at ,null: false

name

    end
  end
end
