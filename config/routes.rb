Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'search_result', to: 'walkcourse#search'

  resources :walkcourses do
    resources :spots, only: [:new, :create, :edit, :update, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show, :create, :edit, :update] do
    member do
      get :likes
      get :subjects
    end
  end
  resources :favorites, only: [:index, :create, :destroy]
end
