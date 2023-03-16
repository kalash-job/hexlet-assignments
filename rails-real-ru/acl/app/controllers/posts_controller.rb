# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
    @post = Post.find params[:id]
    authorize @post
  end

  def create
    authorize Post
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find params[:id]
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find params[:id]
    authorize @post

    @post.destroy

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
  # END
end