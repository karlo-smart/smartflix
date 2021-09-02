# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::Create, :vcr do
  subject { described_class.new(title: 'Up').call }

  it 'creates a movie' do
    expect { subject }.to change(Movie, :count).from(0).to(1)
  end

  it 'saves movies attributes' do
    subject

    expect(Movie.last).to have_attributes(
      title: "Up",
      year: 2009,
      rated: "PG",
      released: Date.new(2009, 05, 29),
      runtime: 96,
      genre: "Animation, Adventure, Comedy",
      director: "Pete Docter, Bob Peterson",
      writer: "Pete Docter, Bob Peterson, Tom McCarthy",
      actors: "Edward Asner, Jordan Nagai, John Ratzenberger",
      plot: "78-year-old Carl Fredricksen travels to Paradise Falls in his house equipped with balloons, inadvertently taking a young stowaway.",
      language: "English",
      country: "United States",
      awards: "Won 2 Oscars. 79 wins & 87 nominations total",
      poster: "https://m.media-amazon.com/images/M/MV5BMTk3NDE2NzI4NF5BMl5BanBnXkFtZTgwNzE1MzEyMTE@._V1_SX300.jpg",
      ratings: "[{\"Source\"=>\"Internet Movie Database\", \"Value\"=>\"8.2/10\"}, {\"Source\"=>\"Rotten Tomatoes\", \"Value\"=>\"98%\"}, {\"Source\"=>\"Metacritic\", \"Value\"=>\"88/100\"}]",
      metascore: 88, imdb_rating: 8.2,
      imdb_votes: 966,
      imdb_id: "tt1049413",
      movie_type: nil,
      dvd: Date.new(2015, 11, 21),
      box_office: "$293,004,164",
      production: "Pixar Animation Studios",
      website: "N/A"
    )
  end
end
