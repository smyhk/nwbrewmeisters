require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:steve)
  end

  test "layout links" do
    get root_path
    assert_template 'core_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", users_path, count: 0
    # assert_select "a[href=?]", recipes_path
    # assert_select "a[href=?]", calender_path

    log_in_as(@user)
    get users_path
    assert_select "a[href=?]", users_path
  end

end
