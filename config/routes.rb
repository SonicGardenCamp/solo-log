Rails.application.routes.draw do
  get 'users/show'
  root "shops#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  
  devise_for :admins, controllers: {
    registrations: "admins/registrations",
    sessions:      'admins/sessions',
  }

  get 'map/show_shops', to: 'map#show_shops'
  
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
