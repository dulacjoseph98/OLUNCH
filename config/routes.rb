Rails.application.routes.draw do
  devise_for :users
  root to: 'entities#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entities, only: [:index] do
      resources :locations, only: [:index, :new, :create]
      resources :attendees, only: [:index]
  end

  resources :locations, only: [:show] do
    resources :events, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end



  resources :events, only: [:destroy] do
    resources :attendees, only: [:new, :create]
  end

  resources :attendees, only: [:update]


end
