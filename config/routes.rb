Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  get 'stocks/search'
  get '/my_portfolio' , to:'users#my_portfolio'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'search_stock' , to: 'stocks#search'
  # Defines the root path route ("/")
  root "welcome#index"
end
