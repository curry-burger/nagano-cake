class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  # id_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (id_deleted == false)
  end

  def address_display
    '〒  '+post_code+'  '+address
  end

  def full_name
    self.last_name + "　" + self.first_name
  end

  def full_name_kana
    self.last_name_kana + "　" + self.first_name_kana
  end

end


