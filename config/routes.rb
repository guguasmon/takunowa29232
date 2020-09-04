Rails.application.routes.draw do

  root to: "events#index"
  resources :events

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get "/auth/failure", to: "sessions#failure"
end
