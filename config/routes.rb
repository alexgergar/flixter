Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: [:show]
  root 'static_pages#index'
  get 'privacy', to: 'static_pages#privacy'
  get 'about', to: 'static_pages#about'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]  
  namespace :instructor do
    resources :lessons, only: [:update]
    resources :sections, only: [:update]
    resources :sections, only: [] do              # This section is so course id isn't shown so no one can hack the url to build lesson in a wrong course - no new urls connected to it
      resources :lessons, only: [:create, :edit]   # Then the lesson be nested under it and get section id
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:create, :edit]  #this allows us to get the seciton id and create the actions we need
    end
  end
end