require "test_helper"

class MastersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get masters_show_url
    assert_response :success
  end
end
