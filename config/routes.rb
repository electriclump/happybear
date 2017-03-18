Rails.application.routes.draw do

  root to: 'entries#index'
  resources :entries, only: [:index, :create, :destroy]
  match '/', to: 'entries#create', via: [:post]

end
