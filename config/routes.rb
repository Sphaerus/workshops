Rails.application.routes.draw do
  devise_for :users
  resources :students do
    get :subjects
  end

  resources :visitors, only: :index
  root to: "visitors#index"

  resources :teachers do
  	resources :subjects
  end
  resources :reports
  get "report/subjects", to: "reports#subjects"
end
