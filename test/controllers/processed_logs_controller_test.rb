require 'test_helper'

class ProcessedLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @processed_log = processed_logs(:one)
  end

  test "should get index" do
    get processed_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_processed_log_url
    assert_response :success
  end

  test "should create processed_log" do
    assert_difference('ProcessedLog.count') do
      post processed_logs_url, params: { processed_log: { all_phase_done: @processed_log.all_phase_done, phase: @processed_log.phase } }
    end

    assert_redirected_to processed_log_url(ProcessedLog.last)
  end

  test "should show processed_log" do
    get processed_log_url(@processed_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_processed_log_url(@processed_log)
    assert_response :success
  end

  test "should update processed_log" do
    patch processed_log_url(@processed_log), params: { processed_log: { all_phase_done: @processed_log.all_phase_done, phase: @processed_log.phase } }
    assert_redirected_to processed_log_url(@processed_log)
  end

  test "should destroy processed_log" do
    assert_difference('ProcessedLog.count', -1) do
      delete processed_log_url(@processed_log)
    end

    assert_redirected_to processed_logs_url
  end
end
