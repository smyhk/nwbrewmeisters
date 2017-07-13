Rails.application.routes.draw do

  root 'core_pages#home'

  get  '/about',   to: 'core_pages#about'

  get  '/contact', to: 'core_pages#contact'

  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
