require 'test_helper'

class CorePagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "NW Brewmeisters"
  end

  test "should get about" do
    get core_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get core_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}""
  end

end
