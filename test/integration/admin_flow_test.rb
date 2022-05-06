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

    follow_redirect!
    assert_equal user_path(users(:jimmy)), path

    assert_equal "admin only", flash[:notice]
  end

  test "admin can see their own user page" do
    get signin_path
    post session_path, params: { username: "gapbun", password: "1111" }
    get user_path(users(:gapbun))
    assert_select "p", "admin"
  end

  test "audience can see their own user page" do
    get signin_path
    post session_path, params: { username: "jimmy", password: "1111" }
    get user_path(users(:jimmy))
    assert_select "p", "audience"
  end
end
