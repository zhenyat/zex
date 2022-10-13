require "test_helper"

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demo_index_url
    assert_response :success
  end

  test "should get api_calls" do
    get demo_api_calls_url
    assert_response :success
  end

  test "should get candlesticks" do
    get demo_candlesticks_url
    assert_response :success
  end
end
