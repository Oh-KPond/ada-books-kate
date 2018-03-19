Rails.application.routes.draw do
  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new', as: 'new_book'
  post '/books', to: 'books#create'
  patch '/books/:id', to: 'books#update'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  get '/books/:id', to: 'books#show', as: 'book'
  delete '/books/:id', to: 'books#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
