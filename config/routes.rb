Rails.application.routes.draw do
  resources :accounts do  
  	resources :transactions do
  		collection { post :import }
  	end
  end
  resources :transactions
  resources :categories

  root 'accounts#index'
end
