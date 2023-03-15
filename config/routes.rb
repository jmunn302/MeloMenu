Rails.application.routes.draw do
  get 'support/new'
  get 'support/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dishes, only: [:destroy]
  resources :menus, only: [:show]
  get "menus/:id/qr_code", to: "menus#qr_show"
  resources :templates, only: [:index, :show]
  resources :support_requests, only: [:new, :create]
  resources :users do
    resources :restaurants do
      resources :menus, only: [:index, :edit, :update, :destroy, :create, :new] do
        resources :dishes, except: [:destroy]
    end
  end
end
end
