Rails.application.routes.draw do


  devise_for :admin




   scope module: :public do
    devise_for :customers
    root :to => "homes#top"
    get "/customers/my_page" => "customers#show"
    get 'homes/about'
    resources :items, only:[:show, :index]
    resources :customers, only:[:show]
    resources :cart_items, only:[:index, :update, :destroy, :create]
   end

   namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end
end
