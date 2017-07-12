Rails.application.routes.draw do
  get 'core_pages/about'

  get 'core_pages/contact'

  root 'core_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
