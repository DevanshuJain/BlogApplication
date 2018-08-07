Rails.application.routes.draw do
  get 'welcome/index'
  #devise_for :admins
  devise_for :users
  resources :blog do
    resources :post do
   	  get 'verify', on: :member
      post 'verify', on: :member
      resources :comment
    end
  end
  root 'blog#index'
 #root "welcome#index"
 # root to: redirect('/dev')
#   match '/dev', to: 'devise/registrations#new', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
