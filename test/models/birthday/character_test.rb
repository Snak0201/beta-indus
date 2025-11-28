require "test_helper"

class Birthday::CharacterTest < ActiveSupport::TestCase
  test "should valid Birthday::Character with all required fields" do
    character = Birthday::Character.new(
      last_name: "山田",
      first_name: "太郎",
      last_name_kana: "ヤマダ",
      first_name_kana: "タロウ",
      born_on: Date.today
    )
    assert character.valid?
  end

  test "should valid Birthday::Character with Birthday::Brand association" do
    character = Birthday::Character.new(
      last_name: "山田",
      first_name: "太郎",
      last_name_kana: "ヤマダ",
      first_name_kana: "タロウ",
      born_on: Date.today,
      brand: birthday_brands(:default)
    )
    assert character.valid?
  end

  test "should not valid Birthday::Character without required fields" do
    character = Birthday::Character.new
    assert_not character.valid?
    assert_includes character.errors[:last_name], "can't be blank"
    assert_includes character.errors[:first_name], "can't be blank"
    assert_includes character.errors[:last_name_kana], "can't be blank"
    assert_includes character.errors[:first_name_kana], "can't be blank"
    assert_includes character.errors[:born_on], "can't be blank"
  end

  test "#full_name should returns correct full name" do
    character = birthday_characters(:default)
    assert_equal "DefaultCharacter", character.full_name
  end
end
