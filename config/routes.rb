Rails.application.routes.draw do

devise_for :users,:controllers => { :registrations => "user/registrations"}
resources :welcome

root to: 'welcome#index'


 match '*path', via: :all, to: redirect('/404')
end
