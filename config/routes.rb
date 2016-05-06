Rails.application.routes.draw do
  
  get 'transactions/update'

  get 'transactions/edit'

  get 'transactions/destroy'

  get 'transactions/index'

  get 'transactions/show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end