Rails.application.routes.draw do
  root 'books#index'
  # root_path exists

  resources :authors do
    resources :books, only: [:index, :new]
  end

  resources :books

  get "/auth/:provider/callback", to: "sessions#create" # for multiple providers
  get "/auth/github", as: "github_login" # for just github as provider

  delete "/logout", to: "sessions#destroy", as: "logout"
  # get '/login', to: 'sessions#new', as: 'login_form'
  # post '/login', to: 'sessions#create', as: 'login'

  # get '/books', to: 'books#index'
  #
  # # the following two should always go together
  # get '/books/new', to: 'books#new', as: 'new_book'
  # post '/books', to: 'books#create'
  #
  # # the following two should always go together
  # get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  # patch '/books/:id', to: 'books#update'
  #
  # get '/books/:id', to: 'books#show', as: 'book'
  #
  # delete '/books/:id', to: 'books#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
