Rails.application.routes.draw do
  root to: 'home#welcome'
  resources :tasks, only: %i[index new create edit update destroy] do
    resources :completions, only: %i[create destroy]
  end
  resources :sessions, only: %i[new create]
end
