# frozen_string_literal: true

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
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

    assert_redirected_to root_path
    assert { Task.find_by(id: deleted_task_id).nil? }
  end

  test 'should create task' do
    task_params = {
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      status: 'New',
      creator: Faker::Name.name,
      performer: Faker::Name.name,
      completed: false
    }
    post tasks_path, params: { task: task_params }

    new_task = Task.last
    assert_redirected_to task_path(new_task)
    refute { Task.find_by(task_params).nil? }
  end

  test 'should update task' do
    new_name = Faker::Name.unique.name
    patch task_path(@task), params: { task: { name: new_name } }

    assert_redirected_to task_path(@task)
    refute { Task.find_by(name: new_name).nil? }
  end
end
