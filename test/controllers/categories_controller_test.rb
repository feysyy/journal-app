require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/categories'
    assert_response :success
  end

  test "should get show" do
    category = Category.new
    category.name = "di ko alam ano to"
    category.save
    get "/categories/#{category.id}"
    assert_response :success
  end

  test "should render new form" do
    get "/categories/new"
    assert_response :success
  end

  test "should post create" do
    post "/categories", params: {category: {name: 'di ko alam'} }
    assert_response :redirect
  end

  test "should get edit" do
    category = Category.new
    category.name = "category 3"
    category.save
    get "/categories/#{category.id}/edit"
    assert_response :success
  end

  test "should put update" do
    category = Category.new
    category.name = 'lasdasdsbek'
    category.save
    put "/categories/#{category.id}", params: {category: {name: 'asdasxzzz'}}
    assert_response :redirect
  end

  test "should destroy category" do
    category = Category.new
    category.name = "category sample2"
    category.save
    delete "/categories/#{category.id}"
    assert_response :redirect
  end

end