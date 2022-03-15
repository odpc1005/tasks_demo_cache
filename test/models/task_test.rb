require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  def setup
    @task = Task.new(body: "")
  end
  test "should have a body" do
    assert_not @task.valid?
  end
end
