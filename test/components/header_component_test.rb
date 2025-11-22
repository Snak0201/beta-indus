# frozen_string_literal: true

require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  def test_component_includes_title
    render_inline(HeaderComponent.new)

    assert_selector "header.header_component span.title", text: "βインディの星明かり"
  end
end
