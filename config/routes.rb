Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users, controllers: {registrations: 'registrations'}
  root to: 'fitnesses#index'
  resources :fitnesses do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :users, only: :show
  resources :rooms, only: :show
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
