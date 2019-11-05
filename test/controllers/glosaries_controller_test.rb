require 'test_helper'

class GlosariesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get glosaries_new_url
    assert_response :success
  end

  test "should get create" do
    get glosaries_create_url
    assert_response :success
  end

  test "should get edit" do
    get glosaries_edit_url
    assert_response :success
  end

  test "should get update" do
    get glosaries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get glosaries_destroy_url
    assert_response :success
  end

  test "should get show" do
    get glosaries_show_url
    assert_response :success
  end

end
