Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: :"callbacks#create"}
  root "static_pages#show", page: "home"

  get "static_pages/*page", to: "static_pages#show"
  resources :songs do
    resources :lyrics, only: [:index, :new, :create]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :artists, except: :show
    resources :categories, except: :show
    resources :lyrics, only: :index
  end

  resources :users, only: :show
end
