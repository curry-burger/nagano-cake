Rails.application.routes.draw do

  namespace :public do
    get 'order_items/update'
  end

# ホーム、カート内商品のルーティング
  scope module: :public do
    root :to =>'homes#top'
    get 'about' => 'homes#about', as:'about'
    resources :cart_items, only: [:index,:update,:create,:destroy]
    delete 'cart_item/destroy_all' => 'cart_items#destroy_all' , as: 'destroy_all'
  end


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
