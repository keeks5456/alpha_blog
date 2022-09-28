require "test_helper"

class CreateArticlesTest < ActionDispatch::IntegrationTest
  
  setup do 
    @admin_user = User.create(username: "johndo", email: "jd@email.com", password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new article form and create article" do 
    get "/articles/new"
  end


end
