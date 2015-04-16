require 'test_helper'

class CallbacksControllerTest < ActionController::TestCase
  test "should get github" do
    get :github
    assert_response :success
  end

end
