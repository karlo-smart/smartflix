require 'sidekiq/web'

Rails.application.routes.draw do
  root 'movies#index'

  mount Sidekiq::Web => "/sidekiq"

  resources :movies, only: [:show], param: :title
end
