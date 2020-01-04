Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, only: [:show]
  resources :tweets, only: [:index, :create]

  resources :follows, only: [] do
  	collection do 
  		post :follow
  	end

  	member do
  		delete :unfollow
  	end  	
  end
end
