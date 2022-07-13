require 'test_helper'

class BugReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bug_report = bug_reports(:one)
  end

  test 'should get index' do
    get bug_reports_url, as: :json
    assert_response :success
  end

  test 'should create bug_report' do
    assert_difference('BugReport.count') do
      post bug_reports_url,
           params: { bug_report: { callback: @bug_report.callback, datetime: @bug_report.datetime, description: @bug_report.description, robot: @bug_report.robot, status: @bug_report.status } }, as: :json
    end

    assert_response 201
  end

  test 'should show bug_report' do
    get bug_report_url(@bug_report), as: :json
    assert_response :success
  end

  test 'should update bug_report' do
    patch bug_report_url(@bug_report),
          params: { bug_report: { callback: @bug_report.callback, datetime: @bug_report.datetime, description: @bug_report.description, robot: @bug_report.robot, status: @bug_report.status } }, as: :json
    assert_response 200
  end

  test 'should destroy bug_report' do
    assert_difference('BugReport.count', -1) do
      delete bug_report_url(@bug_report), as: :json
    end

    assert_response 204
  end
end
