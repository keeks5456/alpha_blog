Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "articles#index"
  get "/articles/:id/edit" => "articles#edit"
  delete "/articles/:id" => "articles#destroy"
  # resources :articles, only: [ :index, :show, :new, :create, :update] #edit
  resources :articles #this exposes restful routes for articles resource
end
