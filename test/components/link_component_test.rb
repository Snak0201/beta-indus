# frozen_string_literal: true

require "test_helper"

class LinkComponentTest < ViewComponent::TestCase
  test "should have correct link with text, href and default color" do
    render_inline(LinkComponent.new(link_text: "Example Link", path: "/"))

    assert_selector "a.color_shinosawa-hiro[href='/']", text: "Example Link"
  end

  test "should have correct link with color and data" do
    render_inline(LinkComponent.new(link_text: "Example Link", path: "/", class_name: "color_white", data: { turbo_method: :delete }))

    assert_selector "a.color_white[href='/'][data-turbo-method='delete']", text: "Example Link"
  end
end
