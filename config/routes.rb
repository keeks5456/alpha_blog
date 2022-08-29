Rails.application.routes.draw do

  root "pages#home"
  get 'about' => "pages#about"
  delete "/articles/:id" => "articles#destroy"
  resources :articles, only: [ :index, :show, :new, :create, :edit, :update] #edit
  get 'signup', to: "users#new"
  get '/users/:id/edit', to: "users#edit"
  get '/users/:id/show', to: "users#show"
  resources :users, except: [:new, :show, :edit]
end
