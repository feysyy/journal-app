require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create user" do
    user = User.new
    user.email = "fey15@fey.com"
    user.password = "123456"
    user.password_confirmation = user.password
    assert user.save
  end
end
