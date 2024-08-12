Rails.application.routes.draw do
  get 'games/new', to: 'games#new', as: 'new_game'
  post 'games/score', to: 'games#score', as: 'score_game'

  # Other routes
  get "up" => "rails/health#show", as: :rails_health_check
  # root "posts#index"
end
