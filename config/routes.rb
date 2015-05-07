Rails.application.routes.draw do

  constraints DominioOrganizacion do
    resources :empresas do
      patch :habilitar, on: :member
    end

    resources :comunicaciones do
      resources :mensajes, only: :create
    end

    resources :usuarios, only: %w(edit update)

    get :solicitudes, to: 'organizaciones#solicitudes', as: :solicitudes
    root to: 'empresas#index'
  end

  resources :sesiones, only: %w(create)
  get :login, to: 'sesiones#new'
  get :logout, to: 'sesiones#destroy'

end
