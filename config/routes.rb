Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root to: 'fitnesses#index'
  resources :fitnesses
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: :show
end
