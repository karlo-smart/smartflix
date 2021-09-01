# frozen_string_literal: true

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.filter_sensitive_data('<API_KEY>') { Rails.application.credentials.omdb[:api_key] }
end
