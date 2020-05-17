require 'test_helper'

class Customer::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_orders_index_url
    assert_response :success
  end

end
