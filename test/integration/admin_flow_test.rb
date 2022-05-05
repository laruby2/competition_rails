require "test_helper"

class AdminFlowTest < ActionDispatch::IntegrationTest
  test "cannot see results before login" do
    get results_path
    assert_response :redirect
  end

  test "admin can see results after login" do
    get signin_path
    post session_path, params: { username: "gapbun", password: "1111" }
    get results_path
    assert_response :success
  end

  test "audience cannot see results after login" do
    get signin_path
    post session_path, params: { username: "jimmy", password: "1111" }
    get results_path
    assert_response :redirect
  end
end
