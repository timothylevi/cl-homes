Craigslist::Application.routes.draw do
  root to: "intros#user_type"
  
  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]

  resources :housing_posts do
    member do
      resources :watches, only: [:create]
    end
  end
  
  resources :watches, only: [:destroy]
  
  get "/usertype", to: "intros#user_type", as: "intros_user_type"
  get "/searching/start", to: "intros#searcher_start", as: "intros_searcher_start"
  get "/posting/start", to: "intros#poster_start", as: "intros_poster_start"

  get "/posts/map", to: "housing_posts#index_map", as: "index_map"
  
  get "/watchlist", to: "users#watchlist", as: "user_watchlist"
  get "/listings", to: "users#listings", as: "user_listings"
end
