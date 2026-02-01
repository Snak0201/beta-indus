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
    assert_includes character.errors[:last_name], "を入力してください"
    assert_includes character.errors[:first_name], "を入力してください"
    assert_includes character.errors[:last_name_kana], "を入力してください"
    assert_includes character.errors[:first_name_kana], "を入力してください"
    assert_includes character.errors[:born_on], "を入力してください"
  end

  test "full_name method should returns correct full name" do
    character = birthday_characters(:default)
    assert_equal "DefaultCharacter", character.full_name
  end

  test "nearer_birthday scope should return characters ordered by upcoming birthdays" do
    character_attrs = birthday_characters(:default).attributes.symbolize_keys.slice(:last_name, :first_name, :last_name_kana, :first_name_kana, :born_on)

    character_today = birthday_characters(:default)
    character_yesterday = Birthday::Character.create!(character_attrs.merge(born_on: Date.yesterday))
    character_tomorrow = Birthday::Character.create!(character_attrs.merge(born_on: Date.tomorrow))
    character_next_month = birthday_characters(:has_brand)

    assert_equal [ character_today, character_tomorrow, character_next_month, character_yesterday ],
                 Birthday::Character.nearer_birthday
  end
end
