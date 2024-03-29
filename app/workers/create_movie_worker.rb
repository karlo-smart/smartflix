require 'sidekiq-scheduler'

class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options queue: :movies, retry: false

  def perform(title)
    Movies::Create.new(title: title).call
  end
end
