Rails.application.routes.draw do
  resources :mining_types
  root 'welcome#index'
  
  resources :coins
  # get '/coins', to: 'coins#index'

end
