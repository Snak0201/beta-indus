require "test_helper"

class Tools::StaminaCalculationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tools_stamina_calculation_url
    assert_response :success
  end
end
