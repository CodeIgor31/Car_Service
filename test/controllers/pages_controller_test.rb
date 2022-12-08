require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get services" do
    get pages_services_url
    assert_response :success
  end

  test "should get gallery" do
    get pages_gallery_url
    assert_response :success
  end

  test "should get contacts" do
    get pages_contacts_url
    assert_response :success
  end
end
