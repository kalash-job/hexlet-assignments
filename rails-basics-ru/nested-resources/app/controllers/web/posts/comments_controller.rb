# frozen_string_literal: true

class Web::Posts::CommentsController < Web::Posts::ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @post = resource_post
    @comment = @post.comments.build(comment_params)
    @comments = @post.comments
    if @comment.save
      redirect_to post_path(@post), notice: "Comment was successfully added."
    else
      render 'web/posts/show', status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = resource_post
    @comment.destroy

    redirect_to @post, notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
