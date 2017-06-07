Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  # get 'questions/index'

  # get 'questions/show'

  # get 'questions/new'

  # get 'questions/create'

  # get 'questions/update'

  # get 'questions/destroy'

  devise_for :users

  resources :questions
  resources :answers

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
