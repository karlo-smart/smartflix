# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  let(:title) { 'Up' }
  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET #show' do
    context 'when movie exists in DB' do
      before { create(:movie, title: title) }

      it 'renders movie in JSON and returns http success', aggregate_failures: true do
        get("/movies/#{title}")

        expect(response).to have_http_status(:success)
        expect(parsed_response['title']).to eq(title)
      end
    end

    context 'when movie does not exist in DB' do
      it 'fetches the movie data' do
        expect(CreateMovieWorker).to receive(:perform_async).with(title)

        get("/movies/#{title}")
      end
    end
  end
end
