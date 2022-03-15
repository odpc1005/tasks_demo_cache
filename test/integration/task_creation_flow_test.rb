require "test_helper"

class TaskCreationFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create valid task" do
    assert_difference "Task.count", 1 do
      post api_v1_tasks_path, params: {task: {body: 'this a task'}}
      assert_response :success
    end
  end
end
