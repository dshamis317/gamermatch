Rails.application.routes.draw do

  root 'welcome#index'
  get 'games/search' => 'games#search'
end
