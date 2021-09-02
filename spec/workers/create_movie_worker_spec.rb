# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateMovieWorker, type: :worker do
  subject { described_class.new.perform(title) }

  let(:title) { 'Up' }
  let(:movie) { instance_double('Movies::Create') }

  before do
    allow(Movies::Create).to receive(:new).and_return(movie)
  end

  it 'calls Movies::Create', aggregate_failures: true do
    expect(Movies::Create).to receive(:new).with(title: title).and_return(movie)
    expect(movie).to receive(:call)

    subject
  end
end
