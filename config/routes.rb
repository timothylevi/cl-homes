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

  put "housing_posts/:id/watch", to: "housing_posts#toggle_watch", as: "toggle_post_watch"
  
  get "welcome/usertype", to: "intros#user_type", as: "intros_user_type"
  get "welcome/searching/start", to: "intros#searcher_start", as: "intros_searcher_start"
  get "welcome/posting/start", to: "intros#poster_start", as: "intros_poster_start"
  get "welcome/search/posts", to: "housing_posts#welcome_search", as: "welcome_search"
  
  get "broker/new", to: "users#new_broker", as: "new_broker"
  
  
  get "/watchlist", to: "users#watchlist", as: "user_watchlist"
  get "/listings", to: "users#listings", as: "user_listings"
end
