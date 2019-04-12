Rails.application.routes.draw do
  get 'users/show' => 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get 'articles/new' => 'articles#new'
  get 'articles/:id' => 'articles#show'
  patch 'articles/:id' => 'articles#update'
  delete 'articles/:id' => 'articles#destroy'
  post 'articles/' => 'articles#create' 
  get 'articles/:id/edit' => 'articles#edit'
end
