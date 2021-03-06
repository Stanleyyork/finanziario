Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/' => 'transactions#index'
  get '/settings' => 'users#edit'

  get '/users/:id' => 'users#show'
  get 'revenuecost' => 'transactions#revenuecost'

  resources :transactions do
    collection { post :import_csv }
  end

end