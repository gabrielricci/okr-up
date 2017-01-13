require 'test_helper'

class KeyResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @key_result = key_results(:one)
  end

  test "should get index" do
    get key_results_url
    assert_response :success
  end

  test "should get new" do
    get new_key_result_url
    assert_response :success
  end

  test "should create key_result" do
    assert_difference('KeyResult.count') do
      post key_results_url, params: { key_result: { description: @key_result.description, objective_id: @key_result.objective_id } }
    end

    assert_redirected_to key_result_url(KeyResult.last)
  end

  test "should show key_result" do
    get key_result_url(@key_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_key_result_url(@key_result)
    assert_response :success
  end

  test "should update key_result" do
    patch key_result_url(@key_result), params: { key_result: { description: @key_result.description, objective_id: @key_result.objective_id } }
    assert_redirected_to key_result_url(@key_result)
  end

  test "should destroy key_result" do
    assert_difference('KeyResult.count', -1) do
      delete key_result_url(@key_result)
    end

    assert_redirected_to key_results_url
  end
end
