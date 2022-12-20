class Item < ApplicationRecord
  
  #アソシエーション genre : item  => N : 1
  belongs_to :genre
  # belongs_to :genre, optional: true  #一次的にバリデーションの解除後で削除
  
  #Activestrageでitemモデルにitem_imageカラムとして画像を持たせる
  has_one_attached :item_image
  
  # 商品画像が存在しない場合no_image.jpgの画像を表示する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  # 消費税を求めるメソッド
  def with_tax_ptice
    (price*1.1).floor
  end
  
end
