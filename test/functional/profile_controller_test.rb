require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get me" do
    get :me
    assert_response :success
  end

  test "should get member" do
    get :member
    assert_response :success
  end

  test "should get plants" do
    get :catalog
    assert_response :success
  end

end
