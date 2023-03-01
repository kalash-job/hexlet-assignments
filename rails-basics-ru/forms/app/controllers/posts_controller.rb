# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.ordered_posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
      flash[:success] = "New post #{@post.title} has been created"
    else
      render :new, status: :unprocessable_entity
      flash[:failure] = 'New post has not been created'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:success] = "The post #{@post.title} has been updated"
    else
      render :edit, status: :unprocessable_entity
      flash[:failure] = "The post #{@post.title} has not been updated"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
    flash[:success] = 'The post has been deleted'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :summary, :published)
  end
end
