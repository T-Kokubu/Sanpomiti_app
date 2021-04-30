Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]
  resources :walkcourses do
    resources :spots, only: [:new, :create, :edit, :update, :destroy]
  end
end
