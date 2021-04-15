Rails.application.routes.draw do
  get 'projects/index'
  get 'projects/show'
  get 'investments/new'
  get 'investments/create'
  get 'pitches/index'
  get 'pitches/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  authenticated :user do 
    get "/choose-universe",to: "pages#choose_universe"
    get "/entrepreneur-tutorial",to: "pages#entrepreneur_tutorial"
    get "/contributor-tutorial",to: "pages#contributor_tutorial"
    get "/pitch-list",to: "pages#pitch_list"
    resources :projects, only: [:index, :show]

  end

  authenticated :user, lambda {|u| u.is_entrepreneur?} do
    namespace :entrepreneur do
      resources :projects, only: %i[index new create edit update destroy show] do
        resources :pitches, only: %i[index show new create edit update destroy]
      end
    end
  end
end
