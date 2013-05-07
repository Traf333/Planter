require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "check full_name" do
    @user = users(:one)
    assert "#{last_name} #{name} #{surname}" == @user.full_name
  end
end
