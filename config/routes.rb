Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :users, only: :create
      resources :sessions, only: :create
      get '/activities', to: 'activities#index'
      resources :road_trip, only: [:create], controller: :roadtrips
    end
  end
end
