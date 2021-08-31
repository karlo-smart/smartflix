# frozen_string_literal: true

module Apis
  module Omdb
    class Client
      include HTTParty

      base_uri Rails.application.credentials.omdb[:api_url]
      default_params apikey: Rails.application.credentials.omdb[:api_key]

      def initialize(title:)
        @options = { query: { t: title } }
      end

      def get_movie
        self.class.get('', options)
      end

      private

      attr_reader :options
    end
  end
end
