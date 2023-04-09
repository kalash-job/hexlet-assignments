# frozen_string_literal: true

class Web::Movies::CommentsController < Web::Movies::ApplicationController
  before_action :resource_movie

  def index
    @comments = @movie.comments
  end

  def new
    @comment = @movie.comments.new
  end

  def edit
    @comment = @movie.comments.find params[:id]
  end

  def create
    @comment = @movie.comments.new comment_params

    if @comment.save
      redirect_to movie_comments_path(@movie), notice: t('.success')
    else
      flash.now[:failure] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @comment = @movie.comments.find params[:id]

    if @comment.update comment_params
      redirect_to movie_comments_path(@movie), notice: t('.success')
    else
      flash.now[:failure] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @movie.comments.find params[:id]
    if @comment.destroy
      redirect_to movie_comments_path(@movie), notice: t('.success')
    else
      redirect_to movie_comments_path(@movie), alert: t('.failure')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
