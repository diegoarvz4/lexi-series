require 'test_helper'

class EpisodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get episodes_new_url
    assert_response :success
  end

  test "should get create" do
    get episodes_create_url
    assert_response :success
  end

  test "should get update" do
    get episodes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get episodes_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get episodes_edit_url
    assert_response :success
  end

  test "should get show" do
    get episodes_show_url
    assert_response :success
  end

end
