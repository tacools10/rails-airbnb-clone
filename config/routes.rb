Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
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
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
