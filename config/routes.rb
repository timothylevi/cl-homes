Craigslist::Application.routes.draw do
  root to: "categories#index"
  
  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show]
  resources :subcategories, only: [:show, :create]
  
  resources :community_posts, except: [:index]
  resources :personals_posts, except: [:index]
  resources :events_posts, except: [:index]
  resources :housing_posts, except: [:index]
  resources :sale_posts, except: [:index]
  resources :services_posts, except: [:index]
  resources :jobs_posts, except: [:index]
  resources :gigs_posts, except: [:index]
  
  get "/newpost", to: "new_posts#pick_cat", as: "post_categories"
  
  get "categories/:id/map", to: "categories#map", as: "category_map"
end
