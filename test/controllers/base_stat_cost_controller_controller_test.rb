require 'test_helper'

class BaseStatCostControllerControllerTest < ActionController::TestCase
  test "should get calculate" do
    get :calculate
    assert_response :success
  end

end
