require 'test_helper'

class AttendanceSystemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get attendance_systems_new_url
    assert_response :success
  end

end
