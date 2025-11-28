require "test_helper"

class Birthday::BrandTest < ActiveSupport::TestCase
  test "should valid Birthday::Brand with all required fields" do
    brand = Birthday::Brand.new(
      name: "Test Brand",
      name_kana: "テストブランド",
      formal_name: "Test Brand Formal",
      formal_name_kana: "テストブランドフォーマル",
      born_on: Date.new(2000, 1, 1)
    )
    assert brand.valid?
  end

  test "should not valid Birthday::Brand without required fields" do
    brand = Birthday::Brand.new
    assert_not brand.valid?
    assert_includes brand.errors[:name], "can't be blank"
    assert_includes brand.errors[:name_kana], "can't be blank"
    assert_includes brand.errors[:formal_name], "can't be blank"
    assert_includes brand.errors[:formal_name_kana], "can't be blank"
    assert_includes brand.errors[:born_on], "can't be blank"
  end

  test "nearer_birthday scope should return brands ordered by upcoming birthdays" do
    brand_attrs = birthday_brands(:default).attributes.symbolize_keys.slice(:name, :name_kana, :formal_name, :formal_name_kana, :born_on)

    brand_today = birthday_brands(:default)
    brand_yesterday = Birthday::Brand.create!(brand_attrs.merge(born_on: Date.yesterday))
    brand_tomorrow = Birthday::Brand.create!(brand_attrs.merge(born_on: Date.tomorrow))
    brand_future = Birthday::Brand.create!(brand_attrs.merge(born_on: Date.today.next_month))

    assert_equal [ brand_today, brand_tomorrow, brand_future, brand_yesterday ],
                 Birthday::Brand.nearer_birthday
  end
end
