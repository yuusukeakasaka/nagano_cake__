Rails.application.routes.draw do


  devise_for :admin
  delete  'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'


   scope module: :public do
    root :to => "homes#top"
    get "/customers/my_page" => "customers#show"
    patch "/customers/withdrawl" => "customers#withdrawl", as: 'customers_withdrawl'
    get "/customers/edit" => "customers#edit"
    get 'homes/about'
    get "orders/confirm" => "orders#confirm"
    post "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks", as: 'orders_thanks'
    resources :orders, only:[:new, :create, :index, :show]
    resources :items, only:[:show, :index]
    resources :customers, only:[:edit, :update]
    resources :cart_items, only:[:index, :update, :destroy, :create]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
   end

   namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end

   devise_for :customers, controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
    registrations: "public/registrations"
  }
end
