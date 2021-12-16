# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.order(year: :desc).page(params[:page])
  end

  def show
    movie = Movie.find_by(title: params[:title])

    if movie
      render json: movie
    else
      CreateMovieWorker.perform_async(params[:title])
      render plain: 'Fetching movie...'
    end
  end
end
