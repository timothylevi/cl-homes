Craigslist::Application.routes.draw do
  root to: "categories#index"
  
  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show] do 
    member do
      resources :subcategories, only: [:new]
    end
  end
  resources :subcategories, only: [:show, :create]
  
  get "new_posts/pick_cat"
  
  
  resources :community_posts
  resources :personals_posts
  resources :events_posts
  resources :housing_posts
  resources :sale_posts
  resources :services_posts
  resources :jobs_posts
  resources :gigs_posts
end
