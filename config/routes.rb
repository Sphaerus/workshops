Rails.application.routes.draw do
  devise_for :users
  resources :students do
    get :subjects
  end

  resources :teachers
  resources :reports
  root to: "students#index"
  get "report/subjects", to: "reports#subjects"
end
