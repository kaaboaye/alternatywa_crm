require 'test_helper'

class GroupPresencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_presences_index_url
    assert_response :success
  end

  test "should get new" do
    get group_presences_new_url
    assert_response :success
  end

  test "should get show" do
    get group_presences_show_url
    assert_response :success
  end

  test "should get edit" do
    get group_presences_edit_url
    assert_response :success
  end

  test "should get disabled" do
    get group_presences_disabled_url
    assert_response :success
  end

end
