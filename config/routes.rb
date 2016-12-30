Rails.application.routes.draw do
  resources :accounts do  
  	resources :transactions do
  		# collection { post :import }
      # collection { get :import }
  	end
    resources :import, only: [:new] do 
      collection {post :create }
    end
  end
  resources :transactions do
    collection {get :search }
  end
  resources :categories
  resources :analytics
  
  root 'accounts#index'
end
