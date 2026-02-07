require "test_helper"

class Tools::DicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tools_dice_url
    assert_response :success
  end
end
