require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get how_to_play" do
    get pages_how_to_play_url
    assert_response :success
  end
end
