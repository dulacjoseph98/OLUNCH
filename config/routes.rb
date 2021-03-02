Rails.application.routes.draw do
  devise_for :users
  root to: 'entities#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entities, only: [:index] do
    resources :locations, only: [:index, :new, :create]
    resources :attendees, only: [:index]
    # get "/dashboard", to: "dashboards#dashboard"
    member do 
      get :dashboard, to: "dashboards#dashboard"
    end
  end

  resources :locations, only: [:show] do
    resources :events, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :events, only: [:show, :destroy] do
    resources :attendees, only: [:new, :create]
  end

  resources :attendees, only: [:update] do 
    member do 
      get :accept
      get :decline
    end
  end

end
