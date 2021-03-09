Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/update'
  get 'users/edit'
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :update]
end
