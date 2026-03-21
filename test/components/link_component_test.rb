# frozen_string_literal: true

require "test_helper"

class LinkComponentTest < ViewComponent::TestCase
  test "should have correct link with text, href and default color" do
    render_inline(LinkComponent.new(link_text: "Example Link", path: "/"))

    assert_selector "a.color_shinosawa-hiro[href='/']", text: "Example Link"
  end

  test "should have correct link with white color" do
    render_inline(LinkComponent.new(link_text: "Example Link", path: "/", color: "white"))

    assert_selector "a.color_white[href='/']", text: "Example Link"
  end
end
