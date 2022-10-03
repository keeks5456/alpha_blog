require "test_helper"

class CreateArticlesTest < ActionDispatch::IntegrationTest
  
  setup do 
    @admin_user = User.create(username: "johndo", email: "jd@email.com", password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new article form and create article" do 
    get "/articles/new"
    assert_response :success
    assert_difference "Article.count", 1 do 
      post articles_url, params: { article: {title: "Some title", description: "Some long description" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Some title", response.body
  end


end
