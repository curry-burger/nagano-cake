require "test_helper"

class Public::OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get public_order_items_update_url
    assert_response :success
  end
end
