Rails.application.routes.draw do

  root :to => "homes#top"
  get 'homes/about'
  devise_for :admin

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }


   namespace :public do

    end

    namespace :admin do
    root :to => "homes#top"
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end
end
