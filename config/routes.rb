Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "articles#index"
  get "/articles/:id/edit" => "articles#edit"
  resources :articles, only: [ :index, :show, :new, :create, :update] #edit
end
