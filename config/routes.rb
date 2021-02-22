Rails.application.routes.draw do
  resources :photos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'photos#index'
end
