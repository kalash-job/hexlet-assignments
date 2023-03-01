# frozen_string_literal: true

require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)

    @task_params = {
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      status_id: Status.create(name: :done).id,
      user_id: User.create(name: 'John Doe').id
    }
  end

  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'should get show' do
    get task_path(@task)
    assert_response :success
  end

  test 'should get new' do
    get new_task_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_path(@task)
    assert_response :success
  end

  test 'should destroy task' do
    deleted_task_id = @task.id
    delete task_path(@task)

    assert_redirected_to tasks_path
    assert { Task.find_by(id: deleted_task_id).nil? }
  end

  test 'should create task' do
    post tasks_path, params: { task: @task_params }

    new_task = Task.find_by(@task_params)
    assert { new_task }
    assert_redirected_to task_path(new_task)
  end

  test 'should update task' do
    patch task_path(@task), params: { task: @task_params }

    assert_redirected_to task_path(@task)
    @task.reload
    assert { @task.name == @task_params[:name] }
  end
end
