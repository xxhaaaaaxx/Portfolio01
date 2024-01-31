Rails.application.routes.draw do
  resources :books do
    resources :book_comments
  end

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
