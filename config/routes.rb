Rails.application.routes.draw do
  devise_for :users
  root to: "visitors#index"

  resources :students do
    get :subjects
  end

  resources :visitors, only: :index

  resources :teachers do
  	get 'subjects', on: :member
  end

  get "report/subjects", to: "reports#subjects"
end
