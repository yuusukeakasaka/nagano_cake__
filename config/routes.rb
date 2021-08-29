Rails.application.routes.draw do


  devise_for :admin




   scope module: :public do
    devise_for :customers
    root :to => "homes#top"
    get 'homes/about'
    resources :customers, only:[:show]
   end

   namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end
end
