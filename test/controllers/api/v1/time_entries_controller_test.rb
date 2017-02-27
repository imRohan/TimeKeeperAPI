require 'test_helper'

class Api::V1::TimeEntriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @timeentry = time_entries(:time_entry1)
    @timecard = timecards(:timecard2)
  end

  test "Should get valid list of time entries" do
    get "/api/v1/time_entries"
    assert_response :success
    json_data = JSON.parse response.body
    assert_equal 5, json_data.length
  end

  test "Show one timeentry" do
    get "/api/v1/time_entries/#{@timeentry.id}"
    assert_response :success
    json_data = JSON.parse response.body
    assert_equal json_data['timecard']['username'], "rohan1"
  end

  test "Create a new timeentry" do
    post "/api/v1/time_entries", {format: 'json', time_entry:{time: DateTime.now + (1/24.0), timecard_id: @timecard.id}}
    assert_response :success
  end

  test "Delete a new timeentry" do
    delete "/api/v1/time_entries/#{@timeentry.id}"
    assert_response :success
  end

  test "Create multiple time entries and calculate total_hours" do
    post "/api/v1/time_entries", {format: 'json', time_entry:{time: DateTime.now + (1/24.0), timecard_id: @timecard.id}}
    assert_response :success
    post "/api/v1/time_entries", {format: 'json', time_entry:{time: DateTime.now + (2/24.0), timecard_id: @timecard.id}}
    assert_response :success
    get "/api/v1/timecards/#{@timecard.id}"
    assert_response :success
    json_data = JSON.parse response.body
    assert_equal json_data['total_hours'], "1.0"
  end
end
