Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :games, only: %i[new create show] do
    member do
      post 'answer'
    end
  end
end
