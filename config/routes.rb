Rails.application.routes.draw do
  devise_for :admin

    namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end
end
