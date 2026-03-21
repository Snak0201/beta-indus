# frozen_string_literal: true

require "test_helper"
require "ostruct"

class SessionBarComponentTest < ViewComponent::TestCase
  test "should have links to controls and sign out when user is signed in" do
    session = users(:one).sessions.create!
    cookies_mock = OpenStruct.new(signed: { session_id: session.id })
    render_inline(SessionBarComponent.new(cookies: cookies_mock))
    assert_selector "a", text: "管理画面"
    assert_selector "a", text: "ログアウト"
  end

  test "should have no links when user is not signed in" do
    cookies_mock = OpenStruct.new(signed: { session_id: nil })
    render_inline(SessionBarComponent.new(cookies: cookies_mock))
    assert_no_selector "a", text: "管理画面"
    assert_no_selector "a", text: "ログアウト"
  end
end
