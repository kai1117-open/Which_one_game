require "test_helper"

class Public::QuizRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_quiz_rooms_top_url
    assert_response :success
  end

  test "should get join" do
    get public_quiz_rooms_join_url
    assert_response :success
  end

  test "should get make" do
    get public_quiz_rooms_make_url
    assert_response :success
  end

  test "should get create" do
    get public_quiz_rooms_create_url
    assert_response :success
  end

  test "should get room" do
    get public_quiz_rooms_room_url
    assert_response :success
  end

  test "should get quiz_select" do
    get public_quiz_rooms_quiz_select_url
    assert_response :success
  end

  test "should get quiz_set" do
    get public_quiz_rooms_quiz_set_url
    assert_response :success
  end

  test "should get develop_select" do
    get public_quiz_rooms_develop_select_url
    assert_response :success
  end

  test "should get develop_set" do
    get public_quiz_rooms_develop_set_url
    assert_response :success
  end

  test "should get destroy" do
    get public_quiz_rooms_destroy_url
    assert_response :success
  end

  test "should get start_game" do
    get public_quiz_rooms_start_game_url
    assert_response :success
  end
end
