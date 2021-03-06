Rails.application.routes.draw do
  devise_for :users
  root to: "visitors#index"

  resources :students do
    get :subjects, on: :member
    get :payments, on: :member
  end

  resources :teachers do
  	get :subjects, on: :member
  end

  get "report/subjects", to: "reports#subjects"

  resources :payments, only: [:index]
end
