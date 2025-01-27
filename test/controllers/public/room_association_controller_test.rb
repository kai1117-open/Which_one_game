require "test_helper"

class Public::RoomAssociationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_room_association_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_room_association_destroy_url
    assert_response :success
  end
end
