require 'test_helper'

class PickTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
  end

  test "invalid picks" do
    pick0 = @user.picks.build(round:1, title: "test", name: "test", remark: "alpha beta gumma")
    pick1 = @user.picks.build(round: " ", title: " ", name: " ", remark: " ")
    pick2 = @user.picks.build(round: 0, title: "test", name: "test", remark: "alpha beta gumma")
    assert pick0.valid?
    assert_not pick1.valid?
    assert_not pick2.valid?
    assert_no_difference 'Pick.count' do
      pick1.save
      pick2.save
    end
    assert_difference 'Pick.count', 1 do
      pick0.save
    end
  end
end
