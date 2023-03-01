class TasksController < ApplicationController
  def index
    @tasks = Task.ordered
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
      flash[:success] = "New task #{@task.name} has been created"
    else
      render :new, status: :unprocessable_entity
      flash[:failure] = 'New task has not been created'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
      flash[:success] = "The task #{@task.name} has been updated"
    else
      render :edit, status: :unprocessable_entity
      flash[:failure] = "The task #{@task.name} has not been updated"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
    flash[:success] = 'The task has been deleted'
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :user_id, :status_id)
  end
end
