require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @article = articles(:beer)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { title: "Lorem ipsum",
                                               body: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_redirected_to login_url
  end

end
