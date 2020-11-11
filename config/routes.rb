Rails.application.routes.draw do
  resources :appointments
  resources :veterinarians
  resources :pets do 
    #nested routes
    resources :veterinarians, only: [:index]
    resources :appointments, only: [:index, :new]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pets#index'
end
