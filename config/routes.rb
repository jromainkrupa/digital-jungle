Rails.application.routes.draw do
  namespace :admin do
      resources :users
          resources :workshop_bookings
      resources :workshops
      resources :project_messages

      root to: "users#index"
    end
  devise_for :users,
  controllers: {
    registrations: "users/registrations"
  }

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  root to: "pages#landing_workshops"

  resources :workshops, only: [:show] do 
    resources :workshop_bookings, only: [:create]
  end
  
  authenticated :user do 
    resources :workshop_bookings, only: [:index]
  end
  
  authenticated :user, lambda {|u| u.is_entrepreneur?} do
    namespace :entrepreneur do
      resources :projects, only: %i[index new create edit update destroy show] do
        get "/tutorial-slack",   to: "pages#tutorial_slack"
        get "/congrats",   to: "pages#congrats"
      end
      get  "/tutorial",   to: "pages#tutorial"
      post  "/tutorial",   to: "pages#tutorial"
      get  "/dashboard",  to: "pages#dashboard"
      get  "/statistics", to: "pages#statistics"
    end
  end
  
  authenticated :user, lambda {|u| u.admin?} do
    resources :workshops, only: %i[new create edit update destroy]
  end

  # Static pages
  # get "/landing-entrepreneur",to: "pages#landing_entrepreneur"
  # get "/landing-pitch-app",to: "pages#landing_pitch_app"
  # get "/pricing",to: "pages#pricing"
  # get "/landing-workshops",to: "pages#landing_workshops"
  # get "/landing-contributor",to: "pages#landing_contributor"
end
