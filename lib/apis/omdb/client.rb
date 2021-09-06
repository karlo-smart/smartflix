# frozen_string_literal: true

module Apis
  module Omdb
    class Client
      include HTTParty

      class OmdbError < StandardError; end

      base_uri Rails.application.credentials.omdb[:api_url]
      default_params apikey: Rails.application.credentials.omdb[:api_key]

      def initialize(title:)
        @options = { query: { t: title } }
      end

      def get_movie
        begin
          response = self.class.get('', options)

          raise OmdbError, response['Error'] if failed?(response)
        rescue OmdbError => e
          Rails.logger.error e
        end

        response
      end

      private

      attr_reader :options

      def failed?(response)
        response['Response'] == 'False'
      end
    end
  end
end
