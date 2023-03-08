require "test_helper"

class SupportControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get support_new_url
    assert_response :success
  end

  test "should get create" do
    get support_create_url
    assert_response :success
  end
end
