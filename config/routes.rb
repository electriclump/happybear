Rails.application.routes.draw do

  get 'guestbook/index'

  root to: 'guestbook#index'
  resources :guestbook, only: [:index]
  resources :entries, only: [:index, :new, :create]

end
