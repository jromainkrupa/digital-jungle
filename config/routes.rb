Rails.application.routes.draw do
  get 'pitches/index'
  get 'pitches/show'
  get 'pitches/new'
  get 'pitches/create'
  get 'pitches/edit'
  get 'pitches/update'
  get 'pitches/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  authenticated :user do 
    get "/choose-universe",to: "pages#choose_universe"
    get "/entrepreneur-tutorial",to: "pages#entrepreneur_tutorial"
    get "/contributor-tutorial",to: "pages#contributor_tutorial"
    resources :pitches, only: %i[index show]
  end


  authenticated :user, lambda {|u| u.is_entrepreneur?} do
    resources :projects, only: %i[index new create edit update destroy show] do
      resources :pitches, only: %i[new create edit update destroy]
    end
  end
end
