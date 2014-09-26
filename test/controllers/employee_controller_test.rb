require 'test_helper'

class EmployeeControllerTest < ActionController::TestCase
  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

end
