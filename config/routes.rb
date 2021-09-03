Rails.application.routes.draw do


  devise_for :admin
  delete  'cart_items/destroy_all' => 'public/cart_items#destroy_all'


   scope module: :public do
    root :to => "homes#top"
    get "/customers/my_page" => "customers#show"
    get "/customers/edit" => "customers#edit"
    get 'homes/about'
    resources :items, only:[:show, :index]
    resources :customers, only:[:edit, :update]
    resources :cart_items, only:[:index, :update, :destroy, :create]
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
