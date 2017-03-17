Rails.application.routes.draw do

  root to: 'guestbook#index'
  resources :guestbook, only: [:index]

end
