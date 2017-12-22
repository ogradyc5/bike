Rails.application.routes.draw do

devise_for :users,:controllers => { :registrations => "user/registrations"}
resources :welcome
root to: 'welcome#index'
devise_scope :user do
    get "Sign up", to: "devise/registrations#new"
    match '/sessions.user', to: 'devise/sessions#create' , via: :post
end
 match '*path', via: :all, to: redirect('/404')
end
