Rails.application.routes.draw do


#resources :stores do  
   resources :store_bicycles do  
     resources :bookings  
   end  
#end




resources :stores
resources :bicycles
#devise_for :users,:controllers => { :registrations => "user/registrations"}
devise_for :users

resources :welcome
root to: 'welcome#index'

 match '*path', via: :all, to: redirect('/404')
end
