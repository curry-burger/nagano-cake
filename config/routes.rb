Rails.application.routes.draw do

  scope module: :public do
  	root to:"homes#top"
    get "about"=>"homes#about",as:"about"
    resources :items, only: [:index,:show] # 追加
  end


  # namespace :public do
  #   get 'order_items/update'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end

  # 商品、ジャンルに関するルーティング
  # namespace :public do
  #   resources :items, only: [:index,:show]
  # end
  namespace :admin do
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
  end
  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
  end

  namespace :public do
    resources :addresses, only: [:index,:show,:new,:create]
  end


   namespace :public do
    resources :orders
  end

  namespace :admin do
    resources :order_items, only: [:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 devise_for :customers,skip:[:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip:[:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
end
