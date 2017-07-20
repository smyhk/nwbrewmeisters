require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @user = users(:steve)
    @article = @user.articles.build(title: "Hello",
                                    body: "Lorem ipsum",
                                    user_id: @user.id)
  end

  test "shoud be valid" do
    assert @article.valid?
  end

  test "user id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test "title should be present" do
    @article.title = "    "
    assert_not @article.valid?
  end

  test "title should be no more than 100 characters" do
    @article.title = 'a' * 101
    assert_not @article.valid?
  end

  test "body should be present" do
    @article.body = "    "
    assert_not @article.valid?
  end

end
