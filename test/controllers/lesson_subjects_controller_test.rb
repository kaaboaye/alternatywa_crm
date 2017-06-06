require 'test_helper'

class LessonSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lesson_subjects_index_url
    assert_response :success
  end

  test "should get new" do
    get lesson_subjects_new_url
    assert_response :success
  end

  test "should get edit" do
    get lesson_subjects_edit_url
    assert_response :success
  end

end
