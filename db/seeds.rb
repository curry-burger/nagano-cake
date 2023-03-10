# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者のアカウント
Admin.create!( email: "ad@ad", password: "qazpl,")

# ジャンルの初期値
Genre.create(
  [
    {
      name: 'ケーキ'
    },
    {
      name: '焼き菓子'
    },
    {
      name: 'プリン'
    },
    {
      name: 'キャンディ'
    }
  ]
)

4.times do |n|
  item = Item.create!(
    genre_id: n + 1,
    name: 'チーズケーキ',
    description: '新商品！',
    price: 500,
    status: true
  )
  item.item_image.attach(io: File.open(Rails.root.join("app/assets/images/cake1.jpg")),
  filename: "cake1.jpg"
  )
end
