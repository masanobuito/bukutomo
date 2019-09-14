require 'test_helper'

class Users::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_homes_index_url
    assert_response :success
  end

end
