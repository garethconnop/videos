Rails.application.routes.draw do
  devise_for :users
  
  resources :videos do
  	resources :comments
  end

  root 'videos#index'
end
