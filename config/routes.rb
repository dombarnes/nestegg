Rails.application.routes.draw do
  resources :categories
  resources :accounts do  
  	resources :transactions 
  end

  root 'accounts#index'
end
