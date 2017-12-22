Rails.application.routes.draw do

  resources :store_bicycles do
	  resources :bookings
	end
  resources :stores
  resources :bicycles
  resources :bicycles
  resources :store_cars
#devise_for :users,:controllers => { :registrations => "user/registrations"}
devise_for :users

resources :welcome
root to: 'welcome#index'

 match '*path', via: :all, to: redirect('/404')
end
