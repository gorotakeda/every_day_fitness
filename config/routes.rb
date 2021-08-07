Rails.application.routes.draw do
  devise_for :users
  root to: 'fitnesses#index'
  resources :fitnesses
end
