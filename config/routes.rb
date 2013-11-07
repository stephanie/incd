Incd::Application.routes.draw do
  
  resources :ideas do 
    resources :description
    # resources :problem
    # resources :solution
    # resources :market
    # resources :competition
    # resources :demand
  end

  root 'site#index'

  get 'subscribe' => 'subscribers#new', as: :subscribe

  # Sign in/out
  get    'signin' => 'session#new', as: :signin
  post   'signin' => 'session#create'
  delete 'signout' => 'session#destroy', as: :signout
  
  # Registration
  get  'register' => 'registration#new', as: :register
  post 'register' => 'registration#create'

  # Password reset
  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

end