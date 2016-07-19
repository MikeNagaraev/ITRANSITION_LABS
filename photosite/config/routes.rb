 Rails.application.routes.draw do
  get 'user/load'
  get '/cloud/show/:id', to: 'cloud#show', as: "cloud_show"
  get '/uploads/new/:id', to: 'uploads#new', as: "uploads_new"
  get '/slide_show/index/:id', to: 'slide_show#index', as: "slideshow_index"
  resources :user do
  	resources :uploads
  end
  devise_scope :user do
	get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # get 'cloud/index'
  # get 'user/id', :to => 'user#index'


  devise_for :users
  root 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
