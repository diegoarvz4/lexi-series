require 'test_helper'

class CharacterImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_images_new_url
    assert_response :success
  end

  test "should get create" do
    get character_images_create_url
    assert_response :success
  end

  test "should get destroy" do
    get character_images_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get character_images_edit_url
    assert_response :success
  end

  test "should get update" do
    get character_images_update_url
    assert_response :success
  end

end
