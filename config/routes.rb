Rails.application.routes.draw do
  resources :accounts do  
  	resources :transactions
    resources :import, only: [:new] do 
      collection {post :create }
    end
  end
  resources :transactions, only: :index do 
    collection do 
      get :search
    end
  end
  resources :categories
  resources :analytics, only: [:index]
  
  root 'accounts#index'
end
