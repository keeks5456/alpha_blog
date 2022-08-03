Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "articles#show"
  get 'about', to: 'pages#about'
  resources :articles, only: [:index, :show]
end
