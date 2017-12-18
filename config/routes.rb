Rails.application.routes.draw do
  resources :sellos
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

  get "devise/sessions/new"
  get "charts", to: "charts#index", as: :charts

  devise_scope :usuario do
    root :to => 'devise/sessions#new'
  end

end
