Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within thilss file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :pictures
end
