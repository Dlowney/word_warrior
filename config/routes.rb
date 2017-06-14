Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :levels, only: [:index, :show] do
    resources :questions
  end

  resources :attempts, only: [:show, :new, :create]

  root to: 'pages#home'


get '/pages/about', to: 'pages#about', as: 'about'


end
