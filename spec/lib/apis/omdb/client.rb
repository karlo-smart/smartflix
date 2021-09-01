# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Apis::Omdb::Client do
  subject { described_class.new(title: 'Up').get_movie }

  describe '#call', :vcr do
    it 'returns 200 status' do
      VCR.use_cassette 'omdb_success' do
        subject
        expect(subject.code).to eq(200)
      end
    end
  end
end
