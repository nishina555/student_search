Rails.application.routes.draw do
  root to: 'students#index'
  get 'search', to: 'students#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
