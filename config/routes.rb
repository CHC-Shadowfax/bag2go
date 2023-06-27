Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/about", to: "pages#about"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :bags do
    resources :bookings

    collection do
      # Esto necesita estar en otra vista con mas informacion
      get :my_bags
    end
  end

  # resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
  #   collection do
  #     get :my_prbookings
  #     get :my_bookings
  #     get :my_br
  #   end
  # end
end
