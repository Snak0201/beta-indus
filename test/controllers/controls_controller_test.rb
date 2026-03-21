require "test_helper"

class ControlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index when authenticated" do
    sign_in_as users(:one)
    get controls_url
    assert_response :success
  end

  test "should redirect to sign in page when not authenticated" do
    get controls_url
    assert_redirected_to new_session_path
  end
end
