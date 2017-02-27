require 'test_helper'
require 'json'

class Api::V1::TimecardsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @timecard = timecards(:timecard1)
  end

  test "Should get valid list of timecards" do
    get "/api/v1/timecards"
    assert_response :success
    json_data = JSON.parse response.body
    assert_equal 5, json_data.length
  end

  test "Show one timecard" do
    get "/api/v1/timecards/#{@timecard.id}"
    assert_response :success
    json_data = JSON.parse response.body
    assert_equal json_data['username'], "rohan1"
    assert_equal json_data['time_entries'].size, 5
  end

  test "Create a new timecard" do
    post "/api/v1/timecards", {format: 'json', timecard:{username: "rohan5", occurrence: Date.today.next_day(5)}}
    assert_response :success
  end

  test "Create a dupe timecard failure" do
    post "/api/v1/timecards", {format: 'json', timecard:{username: "rohan4", occurrence: Date.today.next_day(4)}}
    assert_response :unprocessable_entity
  end

  test "Change Username for one timecard" do
    patch "/api/v1/timecards/#{@timecard.id}", {format: 'json', timecard:{username: "derp", occurrence: Date.today.next_day(6)}}
    assert_response :success
  end
end
