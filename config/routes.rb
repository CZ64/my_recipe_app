Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  resources :recipes    # new
  resources :categories # index, create
  resources :units
  resources :ingredients
  resources :user_ingredients

end
