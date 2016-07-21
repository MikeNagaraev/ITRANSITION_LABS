 Rails.application.routes.draw do
  get '/cloud/show/:id', to: 'cloud#show', as: "cloud_show"
  get '/uploads/new/:id', to: 'uploads#new', as: "uploads_new"
  get '/slide_show/show/:id', to: 'slide_show#show', as: "slideshow_show"
  get '/slide_show/create/:id', to: 'slide_show#create', as: "slideshow_create"
  resources :user do
  	resources :uploads
    resources :slide_shows
  end
  devise_scope :user do
	  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users
  root 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
