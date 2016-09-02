Rails.application.routes.draw do

	root 'home#index'

	get '/', to: 'home#index', as: :home

	post 'posts', to: 'posts#create', as: :create_post

	devise_for :users
end
