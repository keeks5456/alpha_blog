require 'test_helper'

# test first development
class ArticleTest < ActiveSupport::TestCase

  def setup 
    @user = User.create(username: "bobby", email: "bobby@gmail.com", password: "password")
    @article = Article.create(title: "Some long title", description: "Some description", user_id: 1)
  end

  test "article should be valid" do 
    assert @article.valid?
  end

  test "title should be present" do 
    @article.title = " "
    assert_not @article.valid? #test for false
  end

  test "title should not be too short" do 
    @article.title = "aa" 
    assert_not @article.valid?
  end

  test "user id should be present" do
    assert @article.user_id
  end

  test "nil user id is invalid" do
      @article.user_id = nil
      assert_not @article.valid?
  end

end