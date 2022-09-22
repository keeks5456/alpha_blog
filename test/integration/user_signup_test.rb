require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest

  # test "valid signup information" do 
  #   get signup_path
  #   assert_response :success 
  #   assert_difference 'User.count', 1 do 
  #     post users_path, params: { user: {  username: "jake", email: "user@invalid.com", password: "password" } }
  #     assert_response :redirect
  #   end
  #   assert_response :redirect
  #   follow_redirect!
  # end

  test "invalid signup information" do
    get signup_path
    assert_response :success
    assert_no_difference 'User.count' do 
      post users_path, params: { user: {  username: "", email: "", password: "" } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

end
