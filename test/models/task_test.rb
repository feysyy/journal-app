require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'should create task with valid name length' do
    # valid name length should be 5 characters
    user = User.new
    user.email = "fey7@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    user.save
    #comment out test/fixtures/users.yml line 7 & 10

    category = Category.new
    category.name = "category 1"
    category.user_id = user.id
    category.save

    task =  Task.new
    task.name = 'sample task 1'
    task.category_id = category.id
    task.user_id = user.id
    assert task.save
  end

  test 'should create task with unique name' do
    user = User.new
    user.email = "fey8@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    user.save

    category = Category.new
    category.name = "category 2"
    category.user_id = user.id
    category.save

    task1 = Task.new
    task1.name = 'sample task 2'
    task1.category_id = category.id  
    task1.user_id = user.id
    assert task1.save

    category = Category.new
    category.name = "category 2"
    category.user_id = user.id
    category.save

    task2 = Task.new
    task2.name = 'sample task 2'
    task2.category_id = category.id
    task2.user_id = user.id
    assert_not task2.save
  end

  test "should update task" do
    user = User.new
    user.email = "fey9@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    user.save

    category = Category.new
    category.name = "category 3"
    category.user_id = user.id
    category.save

    task = Task.new
    task.name = "sample task 3"
    task.description = "task 3"
    task.category_id = category.id
    task.user_id = user.id
    task.save

    task.update({name:"sample task task task", description:"task task task"})
    # assert_not_equal(Task.find_by(name: "maligo ka naman"), Task.find_by(name: "di pa din naliligo"))
    assert_nil(Task.find_by(name: "sample task 3"))
  end

  test "should create time stamp to task" do
    user = User.new
    user.email = "fey10@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    user.save

    category = Category.new
    category.name = "hahahaha"
    category.user_id = user.id
    category.save

    task = Task.new
    task.name = "air supply"
    task.description = "even the nights are better"
    task.category_id = category.id
    task.user_id = user.id
    task.date = DateTime.now
    assert task.save
  end
end