require 'test_helper'

class Users::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_favorites_index_url
    assert_response :success
  end

end
