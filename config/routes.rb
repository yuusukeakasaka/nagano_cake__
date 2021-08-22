Rails.application.routes.draw do
  devise_for :admin

    namespace :admin do
    resources :items
  end
end
