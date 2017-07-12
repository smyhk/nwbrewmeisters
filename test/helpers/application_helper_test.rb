require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "full title helper" do
    assert_equal full_title, "NW Brewmeisters"
    assert_equal full_title("About"), "About | NW Brewmeisters"
    assert_equal full_title("Contact"), "Contact | NW Brewmeisters"
    assert_equal full_title("Sign up"), "Sign up | NW Brewmeisters"
  end

end
