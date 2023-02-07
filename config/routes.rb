Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  delete 'articles/:id', to: 'articles#destroy', as: 'article'
  resources :articles do
    resources :comments
  end
  namespace :api do
    resources :articles, only: [:show, :index, :create, :update, :destroy]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
