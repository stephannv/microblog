Rails.application.routes.draw do
	root 'home#index'

	get '/', to: 'home#index', as: :home

	devise_for :users
end
