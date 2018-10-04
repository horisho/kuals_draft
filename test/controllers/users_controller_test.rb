require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "test", password: "foo")
  end

  test "should reject invalid user" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post signup_path, params:{ user: { name: " ", password: " " } }
    end    
  end

  test "should reject already-registered user" do
    get signup_path
    assert_difference 'User.count', 1 do
      post signup_path, params:{ user: { name: "registered", password: "foo" } }
    end
    assert_no_difference 'User.count' do
      post signup_path, params:{ user: { name: "registered", password: "bar" } }
    end
  end

  test "should get index" do
    get users_path
    assert_template 'users/index'
  end

end
