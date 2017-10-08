Rails.application.routes.draw do
  resources :evidences
  resources :evidencetypes
  resources :permisos
  resources :universidads
  resources :carreras
  resources :escuelas
  resources :facultads
  devise_for :usuarios, controllers: {registrations: "registrations"}

  #resources :universidads
  #resources :permisos
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "home/index"

  root 'home#index'

end
