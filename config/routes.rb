Rails.application.routes.draw do
  resources :accounts do  
  	resources :transactions do
  		collection { post :import }
  	end
  end
  resources :categories

  root 'accounts#index'
end
