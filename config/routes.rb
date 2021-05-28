Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'

  Smartflix::Application.routes.draw do
    mount Sidekiq::Web => "/sidekiq"
  end
end
