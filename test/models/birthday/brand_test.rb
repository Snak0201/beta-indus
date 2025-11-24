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
end
