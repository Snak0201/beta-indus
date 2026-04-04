require "test_helper"

class Controls::Birthday::CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @character = birthday_characters(:default)
  end

  test "should get index when authenticated" do
    sign_in_as @user

    get controls_birthday_characters_url
    assert_response :success
  end

  test "should get new when authenticated" do
    sign_in_as @user

    get new_controls_birthday_character_url
    assert_response :success
  end

  test "should create character when authenticated" do
    sign_in_as @user

    assert_difference("Birthday::Character.count", 1) do
      post controls_birthday_characters_url, params: {
        birthday_character: {
          last_name: "New",
          first_name: "Character",
          last_name_kana: "ニュー",
          first_name_kana: "キャラクター",
          born_on: Date.current,
          color: "#ffffff",
          birthday_brand_id: birthday_brands(:default).id
        }
      }
    end

    assert_redirected_to controls_birthday_characters_url
  end

  test "should not create character with invalid params" do
    sign_in_as @user

    assert_no_difference("Birthday::Character.count") do
      post controls_birthday_characters_url, params: {
        birthday_character: {
          last_name: "",
          first_name: "",
          last_name_kana: "",
          first_name_kana: "",
          born_on: nil
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should destroy character when authenticated" do
    sign_in_as @user

    assert_difference("Birthday::Character.count", -1) do
      delete controls_birthday_character_url(@character)
    end

    assert_redirected_to controls_birthday_characters_url
  end

  test "should redirect index to sign in page when not authenticated" do
    get controls_birthday_characters_url

    assert_redirected_to new_session_path
  end

  test "should redirect new to sign in page when not authenticated" do
    get new_controls_birthday_character_url

    assert_redirected_to new_session_path
  end

  test "should redirect create to sign in page when not authenticated" do
    post controls_birthday_characters_url, params: {
      birthday_character: {
        last_name: "New",
        first_name: "Character",
        last_name_kana: "ニュー",
        first_name_kana: "キャラクター",
        born_on: Date.current
      }
    }

    assert_redirected_to new_session_path
  end

  test "should redirect destroy to sign in page when not authenticated" do
    assert_no_difference("Birthday::Character.count") do
      delete controls_birthday_character_url(@character)
    end

    assert_redirected_to new_session_path
  end
end
