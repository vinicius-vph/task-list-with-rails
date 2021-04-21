Rails.application.routes.draw do
  root 'home#welcome'
  get "/", to: 'home#welcome'
  
  resources :tasks
end
