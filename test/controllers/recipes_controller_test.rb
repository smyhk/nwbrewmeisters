require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @recipe = recipes(:ale)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Recipe.count' do
      post recipes_path, params: { recipe: { name: "Beer",
                                   description: "yummy" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Recipe.count' do
      delete recipe_path(@recipe)
    end
    assert_redirected_to login_url
  end

end
