Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :domains do
  	collection do
  		post :get_email
  	end
  end
end
