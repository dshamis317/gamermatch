Rails.application.routes.draw do

  root 'welcome#index'
  get 'users' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/games' => 'users#show'
  post 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  get 'users/:user_id/games/:id' => 'games#detail'
  delete 'users/:user_id/games/:id' => 'games#destroy'
  get 'games' => 'games#index'
  get 'games/search' => 'games#search'
  get 'games/search/:id' => 'games#show'
  post 'games' => 'games#create'

end
