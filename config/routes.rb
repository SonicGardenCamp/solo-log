Rails.application.routes.draw do
  get 'users/show'
  root "shops#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }

  get 'map/show_reviews', to: 'map#show_reviews'
  
  resources :shops,          only: [:index, :show] do
    resources :reviews,        only: [:index, :new, :create, :show, :destroy, :edit, :update], shallow: true
  end
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
