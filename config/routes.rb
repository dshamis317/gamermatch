Rails.application.routes.draw do

  root 'welcome#index'

  get 'users' => 'users#index'
  get 'users/new' => 'users#new', as: 'sign-up'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/games' => 'users#show', as: 'profile'
  post 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  get 'users/:user_id/games/:id' => 'games#detail'
  delete 'users/:user_id/games/:id' => 'games#destroy'

  get 'games' => 'games#index'
  get 'games/search' => 'games#search'
  get 'games/search/:id' => 'games#show'
  post 'games' => 'games#create'
  get 'games/playing/:id' => 'games#playing'
  get 'games/platforms' => 'games#platforms'

  get 'sessions/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: 'log_out'

end
