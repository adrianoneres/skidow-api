Rails.application.routes.draw do
  root 'welcome#index'
  get 'sign_up' => 'users#new', as: 'sign_up'
  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'log_out' => 'sessions#destroy', as: 'log_out'

  resources :users
  resources :sessions

  resources :account, only: [:index]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'user' => 'users#show'
      resources :users, only: [:show]

      post 'transaction' => 'transactions#create'
    end
  end
end
