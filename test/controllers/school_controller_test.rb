require 'test_helper'

class SchoolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get school_index_url
    assert_response :success
  end

  test "should get new" do
    get school_new_url
    assert_response :success
  end

  test "should get create" do
    get school_create_url
    assert_response :success
  end

  test "should get show" do
    get school_show_url
    assert_response :success
  end

  test "should get edit" do
    get school_edit_url
    assert_response :success
  end

  test "should get update" do
    get school_update_url
    assert_response :success
  end

  test "should get destroy" do
    get school_destroy_url
    assert_response :success
  end

end
