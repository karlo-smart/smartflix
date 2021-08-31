# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    movie = Movie.find_by(title: params[:title])

    render json: movie
  end
end
