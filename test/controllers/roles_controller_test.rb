require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get roles_create_url
    assert_response :success
  end

end
