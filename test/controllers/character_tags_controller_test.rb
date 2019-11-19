require 'test_helper'

class CharacterTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get character_tags_show_url
    assert_response :success
  end

  test "should get index" do
    get character_tags_index_url
    assert_response :success
  end

  test "should get new" do
    get character_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get character_tags_create_url
    assert_response :success
  end

  test "should get edit" do
    get character_tags_edit_url
    assert_response :success
  end

  test "should get update" do
    get character_tags_update_url
    assert_response :success
  end

  test "should get destroy" do
    get character_tags_destroy_url
    assert_response :success
  end

end
