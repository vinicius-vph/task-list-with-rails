Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do
  #     root to: 'api#index'

  #     # get 'users', to: 'users#show'
  #     resources :users, only: %i[show new create update destroy]

  #     resources :boards, only: %i[index new show create update destroy] do
  #       resources :contexts, only: %i[index new show create update destroy] do
  #         resources :tasks, only: %i[index new show create update destroy]
  #       end
  #     end
  #   end
  # end

  # namespace :app do
    root to: 'welcome#index'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    get 'register', to: 'users#new'
    post 'users', to: 'users#create'

    resources :password_resets, only: [:new, :create, :edit, :update]

    # resources :tasks, only: %i[index new create edit update destroy] do
    #   post 'completions', to: 'completions#create'
    #   delete 'completions', to: 'completions#destroy'
    # end

    # resources :boards, only: %i[index new show create edit update destroy] do
    #   resources :contexts, only: %i[new create edit update destroy]
    # end

    resources :boards, only: %i[index new show create update destroy] do
      resources :contexts, only: %i[new show create update destroy] do
        resources :tasks, only: %i[new create edit update destroy] do
          post 'completions', to: 'completions#create'
          delete 'completions', to: 'completions#destroy'
        end
      end
    end
  # end
end
