Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]  #To fix the problem of user_path

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
