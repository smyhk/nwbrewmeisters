require 'test_helper'

class CorePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get core_pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get core_pages_contact_url
    assert_response :success
  end

  test "should get home" do
    get root_url
    assert_response :success
  end

end
