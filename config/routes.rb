Rails.application.routes.draw do
  get 'sessions/new'
  #メソッド 'コントローラ/アクション'

  # For details on the DSL available within thilss file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy, :index]
  
  resources :pictures do
    collection do
      post :confirm
      post :contact_mail
    end
    member do  #idメソッドを取得する
      get :contact_mail
    end
end


mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
