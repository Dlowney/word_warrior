Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :levels, only: :index do
    resources :questions
  end

  resources :attempts, only: [:show, :new, :create]

  root to: 'pages#home'
end
