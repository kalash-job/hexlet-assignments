# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  setup do
    @repository = repositories(:one)
    @link = 'https://github.com/octocat/hello-world.rb'
    @attrs = {
      link: @link
    }
  end

  test 'should get index' do
    get repositories_path
    assert_response :success
  end

  test 'should get show' do
    get repository_path(@repository)
    assert_response :success
  end

  test 'should get new' do
    get new_repository_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_repository_path(@repository)
    assert_response :success
  end

  test 'should create repository' do
    stub_request(:get, 'https://api.github.com/repos/octocat/hello-world.rb')
      .to_return({
                   body: load_fixture('files/response.json'),
                   status: 200,
                   headers: { 'Content-Type' => 'application/json' }
                 })

    post repositories_path, params: { repository: @attrs }
    repository = Repository.find_by(link: @link)

    assert { repository }
    assert { repository.description.present? }
    assert_redirected_to repository_path(repository)
  end

  test 'should update repository' do
    patch repository_path(@repository), params: { repository: @attrs }
    @repository.reload

    assert { @repository.link == @link }
    assert_redirected_to repositories_path
  end

  test 'should destroy repository' do
    delete repository_path(@repository)

    assert { !Repository.exists?(@repository.id) }
    assert_redirected_to repositories_path
  end
  # END
end
