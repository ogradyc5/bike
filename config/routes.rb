Rails.application.routes.draw do
devise_for :users,:controllers => { :registrations => "user/registrations"}

#resources :stores do  
resources :store_bicycles do  
    resources :bookings  
end  
resources :bicycles do
  member do
    put 'like' => 'bicycles#upvote'
    put 'unlike' => 'bicycles#downvote'
  end 
end 

resources :bookings, only: [:create, :destroy]
resources :store_bicycles
resources :activities
resources :pages
resources :user_bookings, only: [:create, :destroy]
resources :activities
resources :friendships
resources :users, only: [:show]
resources :stores
resources :bicycles
resources :welcome
root to: 'welcome#index'

get 'list_bookings', to: 'bookings#list'
get 'search_bookings', to: 'bookings#search'
get 'search_store_bicycles', to: 'store_bicycles#search'
get 'activities/index'
get '/search' => 'pages#search', :as => 'search_page'
get 'my_friends', to: 'users#my_friends'
get 'search_friends', to: 'users#search'
get 'my_profile', to: 'users#my_profile'
post 'add_friend', to: 'users#add_friend'
match '*path', via: :all, to: redirect('/404')
end
