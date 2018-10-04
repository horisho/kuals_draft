require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_template 'layouts/_head'
    assert_template 'layouts/_header'
    assert_template 'layouts/_footer'
  end

end
