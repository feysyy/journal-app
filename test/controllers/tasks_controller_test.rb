require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should render new task form" do
    category = Category.new
    category.name = "category sample"
    category.user_id = user.id
    category.save

    get "/categories/#{category.id}/tasks/new"
    assert_response :success
  end 

  test "should create task" do
    category = Category.new
    category.name = "sample category"
    category.save

    post "/categories/#{category.id}/tasks", params: {task: {name: "task sample", description: "sample task"} }
    assert_response :redirect
  end 

  test "should show single task" do
    category = Category.new
    category.name = "show mo naman"
    category.save

    task = Task.new
    task.name = "pa show naman ng task"
    task.description = "paki show please"
    task.category_id = category.id
    task.save

    get "/categories/#{category.id}/tasks/#{task.id}"
    assert_response :success
  end

  test "should render edit task form" do
    category = Category.new
    category.name = "ano ba to"
    category.save

    task = Task.new
    task.name = "pano ba to gawin?"
    task.description = "di ko rin alam paano to"
    task.category_id = category.id
    task.save

    get "/categories/#{category.id}/tasks/#{task.id}/edit"
    assert_response :success
  end 

  test "should update task" do
    category = Category.new
    category.name = "alphabet"
    category.save

    task = Task.new
    task.name = "bmkdfdflss"
    task.description = "pspgkrowfdscx"
    task.category_id = category.id
    task.save

    put "/categories/#{category.id}/tasks/#{task.id}", params: {task: {name: "abcdefghij", description: "klmnopqrstuv"}}
    assert_response :redirect
  end 


  test "should destroy task" do
    category = Category.new
    category.name = "wag mo i-delete"
    category.save

    task = Task.new
    task.name = "paki delete nitow"
    task.description = "delete mo na kasis"
    task.category_id = category.id
    task.save
    
    delete "/categories/#{category.id}/tasks/#{task.id}"
    assert_response :redirect
  end 
end