Rails.application.routes.draw do
  
  resources :photos do
    resources :comments
    member do
      put 'like', to: "photos#like"
      put 'unlike', to: "photos#unlike"
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'photos#index'

end

