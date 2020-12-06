Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  resources :users, only: [:show, :edit, :update] do
    get :menus, on: :collection
    get :favorite_recipes, on: :collection
  end

  resources :recipes do
    resource :favorite_recipes, only: [:create, :destroy]
  end
  resources :categories # index, create
  resources :units
  resources :ingredients
  resources :user_ingredients
  resources :menus, only: [:create, :destroy]

end