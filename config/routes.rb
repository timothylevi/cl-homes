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
  
  
  resources :community_posts, except: [:index]
  resources :personals_posts, except: [:index]
  resources :events_posts, except: [:index]
  resources :housing_posts, except: [:index]
  resources :sale_posts, except: [:index]
  resources :services_posts, except: [:index]
  resources :jobs_posts, except: [:index]
  resources :gigs_posts, except: [:index]
end
