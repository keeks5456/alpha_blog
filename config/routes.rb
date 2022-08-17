Rails.application.routes.draw do

  root "pages#home"
  get 'about' => "pages#about"
  delete "/articles/:id" => "articles#destroy"
  resources :articles, only: [ :index, :show, :new, :create, :edit, :update] #edit
  get 'signup', to: "users#new"
  resources :users, except: [:new, :show]
end
