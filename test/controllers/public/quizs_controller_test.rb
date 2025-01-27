require "test_helper"

class Public::QuizsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_quizs_index_url
    assert_response :success
  end

  test "should get new" do
    get public_quizs_new_url
    assert_response :success
  end

  test "should get create" do
    get public_quizs_create_url
    assert_response :success
  end

  test "should get show" do
    get public_quizs_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_quizs_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_quizs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_quizs_destroy_url
    assert_response :success
  end
end
