Rails.application.routes.draw do
  get '/draft',     to: 'picks#new'
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/retrieval',     to: 'picks#retrieval'
  get 'user/show'
  get 'user/index'
  root 'static_pages#home'
  resources :users
  resources :picks do
    member do
      get 'discard'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
