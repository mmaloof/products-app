Rails.application.routes.draw do
  devise_for :users
  get '/' => 'products#index'

  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  get '/random' => 'products#random'

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
  get '/carted_products/:id' => 'carted_products#show'
  delete '/carted_products/:id' => 'carted_products#destroy'
  
  post '/search' => 'products#run_search'
end
