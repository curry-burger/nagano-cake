Rails.application.routes.draw do

  
  # 商品、ジャンルに関するルーティング
  namespace :public do
    resources :items, only: [:index,:show]
  end
  namespace :admin do
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
  end
  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
  end
  

  namespace :public do
    resources :addresses, only: [:index,:show,:new,:create]
  end

  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
