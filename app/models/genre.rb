class Genre < ApplicationRecord
  
  #アソシエーション genre : item  => N : 1
  has_many :items   #dependent: :destroy　#は書かず
end
