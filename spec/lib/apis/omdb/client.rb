# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Apis::Omdb::Client do
  subject { described_class.new(title: title).get_movie }

  let(:api_key) { Rails.application.credentials.omdb[:api_key] }
  let(:title) { 'Up' }

  before { subject }

  describe '#get_movie', :vcr do
    it 'returns 200 status' do
      expect(subject.code).to eq(200)
    end

    it 'fetches movie data', aggregate_failures: true do
      expect(subject['Title']).to eq(title)
      expect(subject['Year']).to eq('2009')
    end

    it 'calls omdb endpoint' do
      assert_requested :get, "http://www.omdbapi.com/?apikey=#{api_key}&t=#{title}", :times => 1
    end
  end
end
