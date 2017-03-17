Rails.application.routes.draw do

  get 'entries/create'

  get 'guestbook/index'

  root to: 'guestbook#index'
  resources :guestbook, only: [:index]
  resources :entries, only: [:create]

end
