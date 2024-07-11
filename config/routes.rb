Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'users/account', to: 'users#account', as: 'account'
  get 'users/profile', to: 'users#profile', as: 'profile'

  resources :users do
    resources :reservations, only: [:index]
  end

  resources :rooms do
    resources :reservations, only: [:index, :create] do
      collection do
        post 'confirm'
      end
    end
  end

  get 'search', to: 'rooms#search'
  get 'find_rooms', to: 'rooms#find_rooms'

  namespace :users do
    resource :profile, only: [:edit, :update]
  end
end
