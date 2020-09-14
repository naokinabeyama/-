Rails.application.routes.draw do
  get 'home/about'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:edit, :index, :show, :create, :destroy, :update]
  resources :home, only: [:index, :about]
  root "home#index"
  resources :users, only: [:show, :edit, :update, :index, :create]
end
