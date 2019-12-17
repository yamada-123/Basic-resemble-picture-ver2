Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within thilss file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy, :index]
  resources :pictures do
    collection do
    post :confirm
  end
end
end
