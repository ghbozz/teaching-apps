Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :games, only: %i[create show] do
    member do
      post 'answer'
      post 'start'
    end
  end

  resources :user_games, only: [] do
    member do
      post "ready"
    end
  end
end
