Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "pages#home"
  get 'about' => "pages#about"
  # get "/articles/:id/edit" => "articles#edit"
  delete "/articles/:id" => "articles#destroy"
  resources :articles, only: [ :index, :show, :new, :create, :edit, :update] #edit
  # resources :articles #this exposes restful routes for articles
end
