require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "test_user", password: "testest")
  end

  test "valid user" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  test "name should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end
end
