Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/connectfour", to: "connect_four#create_game"
  get "/connectfour/:id", to: "connect_four#get_game"
  post "/connectfour/:id", to: "connect_four#put_piece"
end
