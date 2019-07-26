Rails.application.routes.draw do
   devise_for :users
   resource :dashboard, only: [:show]
	 root 'static_pages#index'
	 get 'privacy', to: 'static_pages#privacy'
	 resources :courses, only: [:index, :show] do
      resources :enrollments, only: :create
    end

	 resources :lessons, only: [:show]
	 namespace :instructor do
		  resources :lessons, only: [:update]
		  resources :sections, only: [:update] do
        resources :lessons, only: [:new, :create]
      end
        resources :courses, only: [:new, :create, :show] do      		
    	end
    end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

