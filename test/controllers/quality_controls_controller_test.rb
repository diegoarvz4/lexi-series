require 'test_helper'

class QualityControlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quality_controls_new_url
    assert_response :success
  end

  test "should get create" do
    get quality_controls_create_url
    assert_response :success
  end

  test "should get edit" do
    get quality_controls_edit_url
    assert_response :success
  end

  test "should get update" do
    get quality_controls_update_url
    assert_response :success
  end

  test "should get destroy" do
    get quality_controls_destroy_url
    assert_response :success
  end

  test "should get show" do
    get quality_controls_show_url
    assert_response :success
  end

  test "should get index" do
    get quality_controls_index_url
    assert_response :success
  end

end
