Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  authenticated :user do
    get "/choose-universe",to: "pages#choose_universe"
    resources :projects, only: %i[index new create edit update destroy show]
  end
end
