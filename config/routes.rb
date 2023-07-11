Rails.application.routes.draw do
  resources :comments
  resources :reports, except: [:index]
  get "reports",  to: "reports#index", as: "user_root"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "reports#index"
end
