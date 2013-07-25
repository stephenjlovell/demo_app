DemoApp::Application.routes.draw do
  resources :microposts, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :password_resets
  resources :account_activations
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  root to: 'static_pages#home'
  
  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  
  match '/signup',  to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
