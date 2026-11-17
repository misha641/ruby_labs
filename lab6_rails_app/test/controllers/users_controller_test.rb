
require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "registration page is accessible" do
    get new_user_registration_path
    assert_response :success
  end

  test "login page is accessible" do
    get new_user_session_path
    assert_response :success
  end

  test "profile requires authentication" do
    get profile_path
    assert_redirected_to new_user_session_path
  end

  test "old users routes are unavailable" do
    assert_raises(ActionController::RoutingError) do
      Rails.application.routes.recognize_path("/users/1", method: :get)
    end
  end
end
