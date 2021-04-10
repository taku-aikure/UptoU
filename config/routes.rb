Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  devise_for :users

  resources :clothes
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
