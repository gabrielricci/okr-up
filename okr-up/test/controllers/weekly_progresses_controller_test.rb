require 'test_helper'

class WeeklyProgressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_progress = weekly_progresses(:one)
  end

  test "should get index" do
    get weekly_progresses_url
    assert_response :success
  end

  test "should get new" do
    get new_weekly_progress_url
    assert_response :success
  end

  test "should create weekly_progress" do
    assert_difference('WeeklyProgress.count') do
      post weekly_progresses_url, params: { weekly_progress: { key_result: @weekly_progress.key_result, progress: @weekly_progress.progress, quarter: @weekly_progress.quarter, year: @weekly_progress.year } }
    end

    assert_redirected_to weekly_progress_url(WeeklyProgress.last)
  end

  test "should show weekly_progress" do
    get weekly_progress_url(@weekly_progress)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekly_progress_url(@weekly_progress)
    assert_response :success
  end

  test "should update weekly_progress" do
    patch weekly_progress_url(@weekly_progress), params: { weekly_progress: { key_result: @weekly_progress.key_result, progress: @weekly_progress.progress, quarter: @weekly_progress.quarter, year: @weekly_progress.year } }
    assert_redirected_to weekly_progress_url(@weekly_progress)
  end

  test "should destroy weekly_progress" do
    assert_difference('WeeklyProgress.count', -1) do
      delete weekly_progress_url(@weekly_progress)
    end

    assert_redirected_to weekly_progresses_url
  end
end
