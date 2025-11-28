# frozen_string_literal: true

require "test_helper"

class SidebarComponentTest < ViewComponent::TestCase
  test "should have birthday section" do
    render_inline(SidebarComponent.new)
    assert_selector "section", text: "誕生日が近いキャラクター"
    assert_selector "section", text: "誕生日が近いブランド"
  end

  test "nearer birthday characters should display brand name" do
    render_inline(SidebarComponent.new)

    assert_selector "span.name", text: birthday_characters(:default).full_name
    assert_selector "span.name", text: "#{birthday_characters(:has_brand).full_name} (#{birthday_characters(:has_brand).brand.name})"
  end
end
