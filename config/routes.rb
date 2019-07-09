Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    get 'signup', to: 'users#new'
    resources :users, only: [:show, :new, :create]
    resources :asks, only: [:index, :show, :new, :create, :destroy]
    resources :ningens, only: [:index]
    resources :jukens, only: [:index]
    resources :renais, only: [:index]
    resources :kenkous, only: [:index]
    resources :sonotas, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
