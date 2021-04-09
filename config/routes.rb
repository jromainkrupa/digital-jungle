Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  authenticated :user do
    get "/choose-universe",to: "pages#choose_universe"
    get "/entrepreneur-tutorial",to: "pages#entrepreneur_tutorial"
    get "/contributor-tutorial",to: "pages#contributor_tutorial"
    resources :projects, only: %i[index new create edit update destroy show]
  end
end
