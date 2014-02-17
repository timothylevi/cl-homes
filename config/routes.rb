Craigslist::Application.routes.draw do
  root to: "sessions#new"
  
  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]
end
