Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login' => 'sessions#create'
  
  resources :users
  
  root'welcome#index'
end