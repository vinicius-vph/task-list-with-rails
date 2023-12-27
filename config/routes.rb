Rails.application.routes.draw do
  # namespace :auth do
  #   resources :sessions, only: %i[new create destroy]
  # end
  root to: 'home#index'

  resources :sessions, only: %i[new create destroy]

  delete '/signout', to: 'sessions#destroy'
  get '/signin', to: 'sessions#new'
  get '/register', to: 'sessions#register'

  resources :tasks, only: %i[index new create edit update destroy] do
    post 'completions', to: 'completions#create'
    delete 'completions', to: 'completions#destroy'
  end
end
