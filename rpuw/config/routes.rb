Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :games, only: %i[create show] do
    member do
      post 'answer'
      post 'start'
    end
  end
end
