Rails.application.routes.draw do
  get 'games/new', to: 'games#new', as: 'new_game'
  post 'games/score', to: 'games#score', as: 'score_game'

  # Define root path
  root "games#new"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
