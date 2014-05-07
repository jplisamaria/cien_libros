Rails.application.routes.draw do
  root 'homes#show'

  resource :dashboard, only: [:show]
  resource :student_profile_dashboard, only: [:show]
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create] do
    resources :student_profiles, only: [:edit, :update]
  end

  resources :user_books, only: [:new, :create, :index]
  resources :books, only: [:create]
  resources :readings, only: [:index, :create]

end
