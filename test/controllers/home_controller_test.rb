require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get idex" do
    get home_index_url
    assert_response :success
  end

end
