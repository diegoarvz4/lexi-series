require 'test_helper'

class DubcardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dubcards_new_url
    assert_response :success
  end

  test "should get index" do
    get dubcards_index_url
    assert_response :success
  end

  test "should get edit" do
    get dubcards_edit_url
    assert_response :success
  end

  test "should get update" do
    get dubcards_update_url
    assert_response :success
  end

  test "should get create" do
    get dubcards_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dubcards_destroy_url
    assert_response :success
  end

  test "should get show" do
    get dubcards_show_url
    assert_response :success
  end

end
