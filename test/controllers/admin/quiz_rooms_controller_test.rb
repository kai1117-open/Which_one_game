require "test_helper"

class Admin::QuizRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_quiz_rooms_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_quiz_rooms_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_quiz_rooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_quiz_rooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_quiz_rooms_destroy_url
    assert_response :success
  end
end
