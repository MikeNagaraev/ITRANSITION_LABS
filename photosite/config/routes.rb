Rails.application.routes.draw do
  get 'uploads/new'
  resources :uploads
  resources :user do
  	resources :images
  end
  devise_scope :user do
	get '/users/sign_out' => 'devise/sessions#destroy'
  end
   get '/slide_show/create', :to => 'slide_show#create'
  # get 'cloud/index'
  # get 'user/id', :to => 'user#index'


  devise_for :users
  root 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
