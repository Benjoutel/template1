Rails.application.routes.draw do
  devise_for :specialists
  root to: 'pages#home'

  devise_for :patients

  resources :episodes do
    collection do
      get :chrono
    end

    resources :appointments, only: [:new, :create, :edit, :update] do
      resources :documents, only: [:new, :create]
    end
    resources :notes, only: [:new, :create, :edit, :update] do
      resources :documents, only: [:new, :create]
    end

    resources :caregivers, only: [:new, :create]

  end

  resources :events, only: [:edit, :update, :show, :destroy]

  resources :documents, only: [:edit, :update, :destroy]

  resource :profile, only: [:show, :edit, :update]

  namespace :medical_details do
    root to: 'dashboard#show'

    resources :measures, only: [:new, :create, :edit, :update, :destroy]
    resources :vaccinations, only: [:new, :create, :edit, :update, :destroy]
    resources :allergies, only: [:new, :create, :edit, :update, :destroy]
    resources :antecedents, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :caregivers, only: [:index, :new, :create, :edit, :update, :destroy, :show]
end
