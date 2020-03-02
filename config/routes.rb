Rails.application.routes.draw do
  get 'bases/index'

  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    collection { post :import }
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendance_systems/edit_one_month'
      patch 'attendance_systems/update_one_month'
    end
    resources :attendance_systems do
      get 'index'
      patch 'update'
      member do
        get 'edit_overtime_application'
        patch 'update_overtime_application'
      end
    end
  end
  
  resources :bases, only: [:index, :new, :create, :edit, :update, :destroy]
end