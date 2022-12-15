require "test_helper"

class MyServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_services_show_url
    assert_response :success
  end
end
