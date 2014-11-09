require 'test_helper'

class HostGameControllerTest < ActionController::TestCase
  test "should get host" do
    get :host
    assert_response :success
  end

end
