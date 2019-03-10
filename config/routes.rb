Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'

  get '/books/:book_id/reviews', to: 'reviews#index'
  post '/books/:book_id/reviews', to: 'reviews#create'
  get '/books/:book_id/reviews/new', to: 'reviews#new'
  get '/reviews/:id/edit', to: 'reviews#edit'
  get '/reviews/:id', to: 'reviews#show'
  patch '/reviews/:id', to: 'reviews#update'
  put '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy'

  get '/books', to: 'books#index'
  get '/book/:id', to: 'books#show'
  get '/book/:id/edit', to: 'books#edit'
  put '/book/:id', to: 'books#update'
  get '/books/new', to: 'books#new'
  post '/books', to: 'books#create'
  delete '/book/:id', to: 'books#destroy'

  get '/authors/:id', to: 'authors#show'
  delete '/authors/:id', to: 'authors#destroy'

  get '/users/:id', to: 'users#show'
end
