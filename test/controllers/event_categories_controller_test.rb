require 'test_helper'

class EventCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_categories_index_url
    assert_response :success
  end

  test "should get new" do
    get event_categories_new_url
    assert_response :success
  end

  test "should get create" do
    get event_categories_create_url
    assert_response :success
  end

  test "should get show" do
    get event_categories_show_url
    assert_response :success
  end

  test "should get edit" do
    get event_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get event_categories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get event_categories_destroy_url
    assert_response :success
  end

  test "should get disabled" do
    get event_categories_disabled_url
    assert_response :success
  end

  test "should get restore" do
    get event_categories_restore_url
    assert_response :success
  end

end
