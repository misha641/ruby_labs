require "test_helper"

class HiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hi_index_url
    assert_response :success
  end
end
