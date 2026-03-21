require "test_helper"

class Controls::Birthday::CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get controls_birthday_characters_index_url
    assert_response :success
  end

  test "should get new" do
    get controls_birthday_characters_new_url
    assert_response :success
  end

  test "should get edit" do
    get controls_birthday_characters_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get controls_birthday_characters_destroy_url
    assert_response :success
  end
end
