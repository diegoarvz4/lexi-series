require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get characters_new_url
    assert_response :success
  end

  test "should get edit" do
    get characters_edit_url
    assert_response :success
  end

  test "should get update" do
    get characters_update_url
    assert_response :success
  end

  test "should get create" do
    get characters_create_url
    assert_response :success
  end

  test "should get delete" do
    get characters_delete_url
    assert_response :success
  end

  test "should get show" do
    get characters_show_url
    assert_response :success
  end

end
