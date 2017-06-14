Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :levels, only: [:index, :show] do
    resources :questions

    resources :attempts, only: [:show, :new, :create]
  end

  root to: 'pages#home'


get '/pages/about', to: 'pages#about', as: 'about'


end
