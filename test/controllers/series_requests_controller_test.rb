require 'test_helper'

class SeriesRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get series_requests_new_url
    assert_response :success
  end

  test "should get edit" do
    get series_requests_edit_url
    assert_response :success
  end

  test "should get update" do
    get series_requests_update_url
    assert_response :success
  end

end
