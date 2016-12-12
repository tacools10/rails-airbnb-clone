Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users do
    resources :assets do
      resources :offers
    end
  end

  namespace :admin do
    resources :assets, only: [:index]
  end

  resources :users do
    resources :offers, only: [:index]
  end

  resources :users do
    resources :appointments, only: [:index]
  end

  resources :users do
    resources :assets do
      resources :appointments
    end
  end

  resource :user, only: [] do
    member do
      get 'profile'
      get 'dashboard'
      get 'offers'
    end
  end

  root to: 'pages#home'
  get '/redirect', to: 'users/omniauth_callbacks#redirect'
  get '/callback', to: 'users/omniauth_callbacks#redirect'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
