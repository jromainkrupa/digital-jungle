Rails.application.routes.draw do

  mount ForestLiana::Engine => '/forest'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  root to: "pages#landing_workshops"
  resources :projects, only: [:index]
  get "/landing-entrepreneur",to: "pages#landing_entrepreneur"
  get "/landing-pitch-app",to: "pages#landing_pitch_app"
  get "/pricing",to: "pages#pricing"
  # get "/landing-workshops",to: "pages#landing_workshops"
  get "/landing-contributor",to: "pages#landing_contributor"

  authenticated :user do 
    get "/choose-universe",to: "pages#choose_universe"
    get "/contributor-tutorial",to: "pages#contributor_tutorial"
    get "/pitch-list",to: "pages#pitch_list"
    get "/favorites", to: "users#favorites"
    get "/investor-ranking", to: "users#ranking"
    resources :investments, only: [:index]
    resources :projects, only: [:show] do
      resource :like
      resources :investments, only: [:new, :create]
    end
  end

  authenticated :user, lambda {|u| u.is_entrepreneur?} do
    namespace :entrepreneur do
      resources :projects, only: %i[index new create edit update destroy show] do
        get "/tutorial-slack",   to: "pages#tutorial_slack"
        get "/congrats",   to: "pages#congrats"
        resources :pitches, only: %i[index show new create edit update destroy]
      end
      get  "/tutorial",   to: "pages#tutorial"
      post  "/tutorial",   to: "pages#tutorial"
      get  "/dashboard",  to: "pages#dashboard"
      get  "/statistics", to: "pages#statistics"
    end
  end
end
