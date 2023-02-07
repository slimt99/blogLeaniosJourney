require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get [action_names]" do
    get api_[action_names]_url
    assert_response :success
  end

end
