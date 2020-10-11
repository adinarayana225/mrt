Rails.application.routes.draw do
  
  root 'movies#index'

  resources :movies do 
  	collection { post :import }
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
