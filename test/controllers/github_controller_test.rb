require 'test_helper'

class GithubControllerTest < ActionController::TestCase
  test "should get github_profile" do
    get :github_profile
    assert_response :success
  end

  test "should get github_repository" do
    get :github_repository
    assert_response :success
  end

end
