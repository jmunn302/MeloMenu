Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :templates, only: [:index, :show]
  resources :menus, only: [:show]
  resources :users do
    resources :restaurants  do
      resources :menus, only: [:index, :edit, :update, :destroy, :create, :new] do
        resources :dishes
      end
    end
  end

end
