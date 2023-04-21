# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create repository' do
    stub_request(:get, 'https://api.github.com/repos/octocat/hello-world.rb')
      .to_return({
                   body: load_fixture('files/response.json'),
                   status: 200,
                   headers: { 'Content-Type' => 'application/json' }
                 })

    link = 'octocat/hello-world.rb'
    post repositories_path, params: { repository: { link: } }
    repository = Repository.find_by(link:)

    assert { repository }
    assert_redirected_to repositories_path
  end
  # END
end
