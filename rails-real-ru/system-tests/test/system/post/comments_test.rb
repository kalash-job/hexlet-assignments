# frozen_string_literal: true

require 'application_system_test_case'

class Post::CommentsTest < ApplicationSystemTestCase
  def setup
    Rails.application.load_seed
  end

  test 'creating a Comment' do
    visit posts_url
    click_on 'Show', match: :first

    fill_in('post_comment_body', with: Faker::Lorem.paragraph_by_chars(number: 180))

    click_on 'Create Comment'

    assert_text 'Comment was successfully created.'
  end

  test 'updating a Comment' do
    visit posts_url
    click_on 'Show', match: :first
    click_on 'Edit', match: :first

    fill_in('Body', with: Faker::Lorem.paragraph_by_chars(number: 180))

    click_on 'Update Comment'

    assert_text 'Comment was successfully updated.'
  end
end
