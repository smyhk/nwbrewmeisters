require 'test_helper'

class ArticlesInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:steve)
    @user = users(:archer)
  end

  test "article interface" do
    log_in_as(@user)
    get new_article_path
    # invalid submission
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { title: "", body: "" } }
    end
    assert_select 'div#error_explanation'
    assert_template 'articles/new'
    # valid submission
    title = "Hello"
    body = "Lorem ipsum"
    assert_difference 'Article.count' do
      post articles_path, params: { article: { title: title, body: body } }
    end
    assert_redirected_to @user
    follow_redirect!
    assert_match title, response.body
    assert_match body, response.body
    # edit link for author, no delete link for non-admins
    assert_select 'a', text: "delete", count: 0
    assert_select 'a', text: "edit"
    # delete a post (admins only)
    log_in_as(@admin)
    get user_path(@admin)
    assert_select 'a', text: 'delete'
    first_article = @admin.articles.paginate(page: 1).first
    assert_difference 'Article.count', -1 do
      delete article_path(first_article)
    end
    # visit different user (no edit link as admin)
    get user_path(users(:archer))
    assert_select 'a', text: "edit", count: 0
  end

end
