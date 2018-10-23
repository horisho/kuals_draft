require 'test_helper'

class PicksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user2)
    @pick = picks(:one)
  end

  test "should redirect when not logged in" do
    assert_no_difference 'Pick.count' do
      post picks_path, params: { round: 1, title: "title", name: "name" }
    end
    assert_redirected_to login_url
  end

  test "non-admin should redirect" do
    assert_no_difference 'Pick.count' do
      delete pick_path(@pick)
    end
    assert_redirected_to login_url
    log_in_as @user
    assert_not @user.admin?
    assert_no_difference 'Pick.count' do
      delete pick_path(@pick)
    end
  end
end
