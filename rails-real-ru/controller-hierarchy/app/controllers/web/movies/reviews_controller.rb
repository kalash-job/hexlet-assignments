# frozen_string_literal: true

class Web::Movies::ReviewsController < Web::Movies::ApplicationController
  before_action :resource_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def edit
    @review = @movie.reviews.find params[:id]
  end

  def create
    @review = @movie.reviews.new review_params

    if @review.save
      redirect_to movie_reviews_path(@movie), notice: t('.success')
    else
      flash.now[:failure] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @review = @movie.reviews.find params[:id]

    if @review.update review_params
      redirect_to movie_reviews_path(@movie), notice: t('.success')
    else
      flash.now[:failure] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = @movie.reviews.find params[:id]
    if @review.destroy
      redirect_to movie_reviews_path(@movie), notice: t('.success')
    else
      redirect_to movie_reviews_path(@movie), alert: t('.failure')
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
