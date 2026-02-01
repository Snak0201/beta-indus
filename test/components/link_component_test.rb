# frozen_string_literal: true

require "test_helper"

class LinkComponentTest < ViewComponent::TestCase
  test "should have correct link with text and href" do
    render_inline(LinkComponent.new(link_text: "Example Link", path: "/"))

    assert_selector "a.link_component[href='/']", text: "Example Link"
  end
end
