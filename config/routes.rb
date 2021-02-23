Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'home#index'
  get 'home/private'
  get 'home/dataprivacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
