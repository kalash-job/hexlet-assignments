# frozen_string_literal: true

require_relative './../services/fetch_repository_info_service'

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(repository_id)
    repository = Repository.find(repository_id)
    repository.do_fetch!
    begin
      repository_info = FetchRepositoryInfoService.new(repository.link).call
      repository.owner_name = repository_info.owner.login
      repository.repo_name = repository_info.name
      repository.description = repository_info.description
      repository.default_branch = repository_info.default_branch
      repository.watchers_count = repository_info.watchers_count
      repository.language = repository_info.language
      repository.repo_created_at = repository_info.created_at
      repository.repo_updated_at = repository_info.updated_at
      repository.save!
    rescue StandardError => exception
      repository.has_failed!
      raise exception
    end
    repository.has_fetched!
  end
end
