# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit posts_url

    assert_selector 'h1', text: 'Posts'
  end

  test 'creating a Post' do
    visit posts_url
    click_on 'New Post'

    post_params = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph_by_chars(number: 180)
    }
    fill_in('Title', with: post_params[:title])
    fill_in('Body', with: post_params[:body])

    click_on 'Create Post'

    assert_text 'Post was successfully created.'
    assert_text post_params[:title]
    assert_text post_params[:body]
  end

  test 'updating a Post' do
    visit posts_url
    click_on 'Edit', match: :first

    post_params = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph_by_chars(number: 190)
    }
    fill_in('Title', with: post_params[:title])
    fill_in('Body', with: post_params[:body])

    click_on 'Update Post'

    assert_text 'Post was successfully updated.'
    assert_text post_params[:title]
    assert_text post_params[:body]
  end

  test 'destroying a Post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed.'
  end
end
# END
