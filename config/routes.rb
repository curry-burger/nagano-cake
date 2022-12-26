Rails.application.routes.draw do

  # namespace :admin do
  #   get 'orders/show'
  # end
  scope module: :public do
    root to:"homes#top"
    get "about"=>"homes#about",as:"about"
    resources:orders,only: [:new,:create,:index]
    post "orders/confirm"=>"orders#confirm",as:"confirm"
    get "orders/complete"=>"orders#complete",as:"complete"
    get "orders/:id"=>"orders#show",as:"order"
    resources :items, only: [:index,:show]
    get "customers/my_page"=>"customers#show", as:"my_page"
    get "customers/infomation/edit"=>"customers#edit", as:"info_edit"
    patch "customers/infomation"=>"customers#update", as:"info"
    get "customers/confirm"=>"customers#confirm"
    patch "customers/exit"=>"customers#exit"
    resources :cart_items, only: [:index,:update,:create,:destroy]
    delete 'cart_item/destroy_all' => 'cart_items#destroy_all' , as: 'destroy_all'
    resources :addresses
  end

  namespace :admin do
      root to:'homes#top'
      resources :orders, only: [:show,:update]
      resources :items, only: [:index,:new,:create,:show,:edit,:update]
      resources :genres, only: [:index,:create,:edit,:update]
      resources:customers,only: [:index,:show,:edit,:update]
      resources:order_items,only: [:update]
      resources:orders,only: [:show,:update]
  end

 devise_for :customers,skip:[:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip:[:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
end
