Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]  
  namespace :instructor do
    resources :sections, only: [] do              # This section is so course id isn't shown so no one can hack the url to build lesson in a wrong course - no new urls connected to it
      resources :lessons, only: [:new, :create, :edit]   # Then the lesson be nested under it and get section id
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create, :edit]  #this allows us to get the seciton id and create the actions we need
    end
  end
end