Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  authenticated :user do
    resources :projects, only: %i[index new create edit update destroy show]
  end
end
