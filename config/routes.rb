Rails.application.routes.draw do
  root "shops#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  resources :shops,          only: [:index, :show] do
    resources :reviews,        only: [:index, :new, :create, :show], shallow: true
  end
end
