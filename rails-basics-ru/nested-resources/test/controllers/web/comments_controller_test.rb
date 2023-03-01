require "test_helper"

class Web::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @post = @comment.post

    @comment_params = {
      body: Faker::Lorem.sentence
    }
  end

  test 'should get edit' do
    get edit_post_comment_path(@comment.post, @comment)
    assert_response :success
  end

  test 'should destroy comment' do
    deleted_comment_id = @comment.id
    delete post_comment_path(@post, @comment)

    assert_redirected_to post_path(@post)
    assert { Comment.find_by(id: deleted_comment_id).nil? }
  end

  test 'should create comment' do
    post post_comments_path(@post), params: { comment: @comment_params }

    new_comment = Comment.find_by(@comment_params)
    assert { new_comment }
    assert_redirected_to post_path(@post)
  end

  test 'should update comment' do
    patch post_comment_path(@post, @comment), params: { comment: @comment_params }

    assert_redirected_to post_path(@post)
    @comment.reload
    assert { @comment.body == @comment_params[:body] }
  end
end
