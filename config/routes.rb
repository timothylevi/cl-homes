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
end
