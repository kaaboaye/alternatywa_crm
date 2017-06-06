require 'test_helper'

class EventPresencesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get event_presences_show_url
    assert_response :success
  end

  test "should get new" do
    get event_presences_new_url
    assert_response :success
  end

end
