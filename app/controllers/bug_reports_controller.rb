class BugReportsController < ApplicationController
  before_action :set_bug_report, only: %i[show update destroy]

  # GET /bug_reports
  def index
    @bug_reports = BugReport.all

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
      render json: @bug_report, status: :created, location: @bug_report
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
