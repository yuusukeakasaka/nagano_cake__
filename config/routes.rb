Rails.application.routes.draw do
  root :to => "homes#top"
  get 'homes/about'
  devise_for :admin



   namespace :public do

    end

    namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end
end
