# frozen_string_literal: true

# BEGIN
require_relative './../../services/get_repository_info_service'
# END

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    @repository = Repository.new(permitted_params)
    repository_info = GetRepositoryInfoService.new(@repository.link).call
    @repository.owner_name = repository_info.owner.login
    @repository.repo_name = repository_info.name
    @repository.description = repository_info.description
    @repository.default_branch = repository_info.default_branch
    @repository.watchers_count = repository_info.watchers_count
    @repository.language = repository_info.language
    @repository.repo_created_at = repository_info.created_at
    @repository.repo_updated_at = repository_info.updated_at

    if @repository.save
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :new, status: :unprocessable_entity
    end
    # END
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
