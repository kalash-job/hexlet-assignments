# frozen_string_literal: true

class GetRepositoryInfoService
  def initialize(link)
    @repository_link = URI.parse(link).path[1..]
  end

  def call
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    client.repository(@repository_link)
  end
end
