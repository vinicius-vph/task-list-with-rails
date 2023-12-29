Rails.application.routes.draw do
  root to: 'home#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'register', to: 'users#new'
  post 'users', to: 'users#create'

  resources :tasks, only: %i[index new create edit update destroy] do
    post 'completions', to: 'completions#create'
    delete 'completions', to: 'completions#destroy'
  end
end
