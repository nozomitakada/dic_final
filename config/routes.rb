Rails.application.routes.draw do
  root 'tops#index'
  
  resources :tops
  resources :houses
  resources :sessions, only: [:new,:create,:show]
  resources :users
  resources :owners, only: [:new, :create]
  resources :contacts
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
