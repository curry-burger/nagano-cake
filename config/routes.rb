Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  scope module: :public do
    root to:"homes#top"
    get "about"=>"homes#about",as:"about"
    resources :items, only: [:index,:show]
    resources :cart_items, only: [:index,:update,:create,:destroy]
    delete 'cart_item/destroy_all' => 'cart_items#destroy_all' , as: 'destroy_all'
  end

  namespace :admin do
    resources :orders, only: [:show,:update]
  end

  namespace :admin do
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
  end
  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
  end

  scope module: :public do
    resources :addresses
  end

  namespace :admin do
    resources :order_items, only: [:update]
  end

#scopeの中はpublicがurlに入らない
    scope module: :public do
  resources:orders,only: [:new,:create,:index]
  post "orders/confirm"=>"orders#confirm",as:"confirm"
  get "orders/complete"=>"orders#complete",as:"complete"
  get "orders/:id"=>"orders#show",as:"order"
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
