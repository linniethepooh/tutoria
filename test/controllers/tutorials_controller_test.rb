require 'test_helper'

class TutorialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorials_index_url
    assert_response :success
  end

  test "should get show" do
    get tutorials_show_url
    assert_response :success
  end

  test "should get destroy" do
    get tutorials_destroy_url
    assert_response :success
  end

  test "should get new" do
    get tutorials_new_url
    assert_response :success
  end

  test "should get create" do
    get tutorials_create_url
    assert_response :success
  end

  test "should get edit" do
    get tutorials_edit_url
    assert_response :success
  end

  test "should get update" do
    get tutorials_update_url
    assert_response :success
  end

end
