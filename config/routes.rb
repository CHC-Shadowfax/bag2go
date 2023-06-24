Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/about", to: "pages#about"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :bags do
    resources :bookings, only: [:new, :create]
    collection do
      get :my_bags
      end
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get :my_prbookings
      get :my_bookings
      end
    patch 'bookings/mypr_bookings', to: 'bookings#update_status', as: :update_status
  end
end
