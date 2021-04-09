Rails.application.routes.draw do
  get 'projects/new'
  get 'projects/create'
  get 'projects/edit'
  get 'projects/update'
  get 'projects/destroy'
  get 'projects/show'
  devise_for :users
  root to: "pages#home"

  authenticated :user do
    resources :project, only: %i[new create edit update destroy show]
  end
end
