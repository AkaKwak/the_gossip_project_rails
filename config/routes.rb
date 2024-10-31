Rails.application.routes.draw do
  get "comments/create"
  get "comments/destroy"
  get "comments/comment_params"
  root "gossips#index"

  resources :gossips do
    resources :comments, only: [:create, :edit, :update]
  end
  resources :users
  resources :cities, only: [:show]
  resources :contacts, only: [:new, :create]

  get "index", to: "gossips#index"
  get 'team', to: 'static_pages#team'
  get 'welcome/:name', to: 'static_pages#welcome', as: 'welcome'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  
end
