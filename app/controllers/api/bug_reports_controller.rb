class Api::BugReportsController < ApplicationController
  include Authenticable

  before_action :authenticate_with_token
  before_action :set_bug_report, only: %i[show update destroy]

  # GET /bug_reports
  def index
    @bug_reports = BugReport.search(params[:term])

    render json: @bug_reports
  end

  # GET /bug_reports/1
  def show
    render json: @bug_report
  end

  # POST /bug_reports
  def create
    @bug_report = BugReport.new(bug_report_params)

    if @bug_report.save
      render json: @bug_report, status: :created, location: api_bug_report_path(@bug_report)
    else
      render json: @bug_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bug_reports/1
  def update
    if @bug_report.update(bug_report_params)
      render json: @bug_report
    else
      render json: @bug_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bug_reports/1
  def destroy
    @bug_report.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bug_report
    @bug_report = BugReport.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bug_report_params
    params.require(:bug_report).permit(:robot, :callback, :status, :description, :datetime)
  end
end

# 2022-07-14 10:27:07 -0300 HTTP parse error, malformed request: #<Puma::HttpParserError: Invalid HTTP format, parsing fails. Are you trying to open an SSL connection to a non-SSL Puma?>

# 2022-07-14 11:28:14 -0300 HTTP parse error, malformed request: #<Puma::HttpParserError: Invalid HTTP format, parsing fails. Are you trying to open an SSL connection to a non-SSL Puma?>
