Rails.application.routes.draw do
  resources :accounts do  
  	resources :transactions do
  		collection { post :import }
      collection { get :import }
  	end
  end
  resources :transactions
  resources :categories
  resources :import, only: [:new, :create]

  root 'accounts#index'
end
