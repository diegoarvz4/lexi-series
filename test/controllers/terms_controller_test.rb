require 'test_helper'

class TermsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get terms_new_url
    assert_response :success
  end

  test "should get create" do
    get terms_create_url
    assert_response :success
  end

  test "should get edit" do
    get terms_edit_url
    assert_response :success
  end

  test "should get update" do
    get terms_update_url
    assert_response :success
  end

end
