# frozen_string_literal: true

require "test_helper"

class FooterComponentTest < ViewComponent::TestCase
  def test_component_includes_title
    render_inline(FooterComponent.new)

    assert_selector "footer.footer_component span.text", text: "βインディの星明かり"
  end
end
