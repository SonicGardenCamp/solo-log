require "test_helper"

class Admins::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_shops_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_shops_create_url
    assert_response :success
  end
end
