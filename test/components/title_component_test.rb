# frozen_string_literal: true

require "test_helper"

class TitleComponentTest < ViewComponent::TestCase
  def test_component_has_title
    render_inline(TitleComponent.new(title: "βインディの星明かり"))
    assert_selector "h1.title_component", text: "βインディの星明かり"
  end
end
