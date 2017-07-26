require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:steve)
  end

  test "profile display articles" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.articles.count.to_s, response.body
    assert_select 'div.pagination', count: 1
    @user.articles.paginate(page: 1).each do |article|
      assert_match article.title, response.body
      assert_match article.body, response.body
    end
  end

  test "profile display recipes" do
    get user_path(@user)
    assert_match @user.recipes.count.to_s, response.body
    assert_select 'div.pagination', count: 1
    @user.recipes.paginate(page: 1).each do |recipe|
      assert_match recipe.name, response.body
      assert_match recipe.description, response.body
    end
  end

end
