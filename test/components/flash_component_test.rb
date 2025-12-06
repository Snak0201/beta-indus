# frozen_string_literal: true

require "test_helper"

class FlashComponentTest < ViewComponent::TestCase
  test "renders flash messages" do
    flash = { notice: "This is a notice", alert: "This is an alert" }
    render_inline(FlashComponent.new(flash: flash))

    assert_selector ".flash_component .message.notice", text: "This is a notice"
    assert_selector ".flash_component .message.alert", text: "This is an alert"
  end
end
