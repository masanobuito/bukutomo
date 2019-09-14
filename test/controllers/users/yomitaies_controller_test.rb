require 'test_helper'

class Users::YomitaiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_yomitaies_index_url
    assert_response :success
  end

end
