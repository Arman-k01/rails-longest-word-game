Rails.application.routes.draw do
  get 'games/new', to: 'games#new', as: 'new_game'
  post 'games/score', to: 'games#score', as: 'score_game'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
