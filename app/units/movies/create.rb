# frozen_string_literal: true

module Movies
  class Create
    def initialize(title:)
      @title = title
    end

    def call
      movie = Movie.new(movie_attributes)
      movie.save
    end

    private

    attr_reader :title

    def movie_attributes
      fetch_data.transform_keys(&:underscore).symbolize_keys.except(:type, :response)
    end

    def fetch_data
      Apis::Omdb::Client.new(title: title).get_movie
    end
  end
end

