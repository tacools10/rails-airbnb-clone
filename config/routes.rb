Rails.application.routes.draw do
  devise_for :users, :path => 'users'
  resources :users do
    resources :assets
  end
end
