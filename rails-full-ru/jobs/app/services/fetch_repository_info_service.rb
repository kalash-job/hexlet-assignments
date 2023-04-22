# frozen_string_literal: true

class FetchRepositoryInfoService
  def initialize(link)
    @repository_link = URI.parse(link).path[1..]
  end

  def call
    client = Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
    client.repository(@repository_link)
  end
end
