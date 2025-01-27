require "test_helper"

class Admin::QuizsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_quizs_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_quizs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_quizs_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_quizs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_quizs_destroy_url
    assert_response :success
  end
end
