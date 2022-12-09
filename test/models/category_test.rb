require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "should not create category if name is less than 5 characters" do
    user = User.new
    user.email = "fey10@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    user.save

    category = Category.new
    category.name = '??'  
    category.user_id = user.id
    assert_not category.save
    # assert_equal(nil, Category.find_by(name: '??'))
  end

  test "should create category" do
    user = User.new
    user.email = "fey11@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    user.save

    category = Category.new
    category.name = "categor sample"
    category.user_id = user.id
    assert category.save

  end

  test "should update category" do
    user = User.new
    user.email = "fey12@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    user.save

    category = Category.new
    category.name = "penge pera"
    category.user_id = user.id
    category.save
    category.update({name: "wala na kong pera"})
    assert_nil(Category.find_by(name: "penge pera"))
  end


end