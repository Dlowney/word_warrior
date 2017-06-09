Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :questions

  resources :attempts, only: [:show, :new, :create] do
    resources :answers, only: :index
  end

  root to: 'pages#home'
end
