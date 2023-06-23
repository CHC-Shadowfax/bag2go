Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/about", to: "pages#about"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :bags do
    resources :bookings
  end
end
