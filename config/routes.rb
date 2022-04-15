Rails.application.routes.draw do
  root to: 'home#welcome'
  resources :tasks, only: %i[index new create edit update destroy] do
    post 'completions', to: 'completions#create'
    delete 'completions', to: 'completions#destroy'
  end
  resources :sessions, only: %i[new create]
end
