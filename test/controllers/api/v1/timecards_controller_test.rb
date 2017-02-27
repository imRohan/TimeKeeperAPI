require 'test_helper'
require 'json'

class Api::V1::TimecardsControllerTest < ActionDispatch::IntegrationTest

  test "Should get valid list of timecards" do
    get "/api/v1/timecards"
    assert_response :success
    json_data = JSON.parse response.body
    p json_data
    assert_equal 5, json_data.length
  end
end
