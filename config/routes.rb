Rails.application.routes.draw do

  mount ForestLiana::Engine => '/forest'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  root to: "pages#home"
  get "/landing-entrepreneur",to: "pages#landing_entrepreneur"
  get "/landing-contributor",to: "pages#landing_contributor"

  authenticated :user do 
    get "/choose-universe",to: "pages#choose_universe"
    get "/contributor-tutorial",to: "pages#contributor_tutorial"
    get "/pitch-list",to: "pages#pitch_list"
    resources :investments, only: [:index]
    resources :projects, only: [:index, :show] do
      resource :like
      resources :investments, only: [:new, :create]
    end

  end

  authenticated :user, lambda {|u| u.is_entrepreneur?} do
    namespace :entrepreneur do
      resources :projects, only: %i[index new create edit update destroy show] do
        resources :pitches, only: %i[index show new create edit update destroy]
      end
      get  "/tutorial",   to: "pages#tutorial"
      post "/tutorial",   to: "pages#tutorial"
      get  "/dashboard",  to: "pages#dashboard"
      get  "/statistics", to: "pages#statistics"
    end
  end
end
