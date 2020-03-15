Rails.application.routes.draw do
  resources :posts do
  	post :like, on: :member
  end
  devise_for :users
  get 'welcome/index'
  root to: "welcome#index"
end
