require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  SITE_NAME = "βインディの星明かり"

  test "should return page title with site name" do
    assert_equal "テストページ | #{SITE_NAME}", page_title("テストページ")
  end

  test "should return site name when title is nil or empty" do
    assert_equal SITE_NAME, page_title(nil)
    assert_equal SITE_NAME, page_title("")
  end
end
