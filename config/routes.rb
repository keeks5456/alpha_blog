Rails.application.routes.draw do

  root "pages#home"
  get 'about' => "pages#about"
  # articles
  delete "/articles/:id" => "articles#destroy"
  resources :articles, only: [ :index, :show, :new, :create, :edit, :update] #edit
# users
  resources :users, except: [:new, :show]
  get '/users/:id/edit', to: "users#edit"
  get '/users/:id', to: "users#show"
  get '/signup', to: "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :categories, except:[:destroy]
end
