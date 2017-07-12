Rails.application.routes.draw do
  root 'core_pages#home'

  get 'core_pages/about'

  get 'core_pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
