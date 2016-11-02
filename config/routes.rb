Rails.application.routes.draw do
  root 'welcome#index'
  get 'sign_up' => 'users#new', as: 'sign_up'
  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'log_out' => 'sessions#destroy', as: 'log_out'

  resources :users
  resources :sessions

  scope :api do
    scope :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
