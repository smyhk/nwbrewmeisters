require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @user = users(:steve)
    @recipe = @user.recipes.build(name: "Best Ale",
                                  description: "The ultimate beer!",
                                  user_id: @user.id)
  end

  test "shoud be valid" do
    assert @recipe.valid?
  end

  test "user id should be present" do
    @recipe.user_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = "    "
    assert_not @recipe.valid?
  end

  test "name should be no more than 100 characters" do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end

  test "name should be no less than 3 characters" do
    @recipe.name = 'a' * 2
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = "    "
    assert_not @recipe.valid?
  end

  test "description should be no more than 240 characters" do
    @recipe.description = 'a' * 241
    assert_not @recipe.valid?
  end

  test "description should be no less than 3 characters" do
    @recipe.description = 'a' * 2
    assert_not @recipe.valid?
  end

end
