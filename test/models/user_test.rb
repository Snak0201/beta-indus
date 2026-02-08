require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "downcases and strips login_name" do
    user = User.new(login_name: " DOWNCASED_NAME ")
    assert_equal("downcased_name", user.login_name)
  end
end
