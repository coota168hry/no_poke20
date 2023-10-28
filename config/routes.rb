Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'indices#top'
  get 'top' , to: 'indices#top'
  get 'search_home' , to: 'indices#search_home'
  get 'search_result' , to: 'indices#search_result'
  get 'random_home' ,to: 'indices#random_home'
  get 'random_result' , to: 'indices#random_result'
  get 'article' , to: 'indices#article'
end
