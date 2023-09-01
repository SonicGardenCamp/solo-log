Rails.application.routes.draw do
  root "shops#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :shops,          only: [:index, :show]
  resources :reviews,        only: [:index, :new, :create, :show]
  resources :relationships,       only: [:create, :destroy]
end
