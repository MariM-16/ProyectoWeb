Rails.application.routes.draw do
  resources :reports
  resources :performances
  resources :responses
  resources :comments
  resources :users
  resources :tickets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :tickets, shallow: true
      end
      resources :tickets
      resources :users
    end 
  end
  resources :users do
    resources :tickets
  end

  resources :tickets do 
    resources :comments
  end

  resources :tickets do 
    resources :responses
  end
 

  resource :user, only: [:show] do
    resources :tickets, only: [:show, :index], shallow: true do
      resources :comments, only: [:show, :index]
      resources :responses, only: [:show, :index]
    end
  end
  
  resources :tickets do
    resources :performances 
  end
end
