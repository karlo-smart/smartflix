# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { described_class.new(title: title) }

  context 'when required attributes are present' do
    let(:title) { 'anything' }

    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'when required attributes are missing' do
    let(:title) { nil }

    it 'is invalid' do
      expect(subject).to_not be_valid
    end
  end
end
