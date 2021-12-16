# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :title, presence: true

  has_many :external_ratings
end
