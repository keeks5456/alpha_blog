require 'test_helper'

# test first development
class CategoryTest < ActiveSupport::TestCase

  #setup method will be ran before each test below is ran
  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do 
    assert @category.valid? #test for true
  end

  test "name should be present" do 
    @category.name = " "
    assert_not @category.valid? #test for false
  end

  test "name should be unique" do 
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be too long" do 
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do 
    @category.name = "aa"
    assert_not @category.valid?
  end

end