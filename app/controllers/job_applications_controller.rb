class JobApplicationsController < ApplicationController
  before_action :authenticate_user!, except: %i[ create ]

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def index
    @job_applications = JobApplication.order(:created_at).page params[:page]
  end

  def create
    @job_application_creator = JobApplicationCreator.new(job_application_params, params[:job_application][:job_ad].to_i)
    @job_application = @job_application_creator.call
    @job_ad = JobAd.find(params[:job_application][:job_ad].to_i)
  end

  private

    def job_application_params
      params.require(:job_application).permit(
        :first_name,
        :last_name,
        :date_of_birth,
        :email,
        :phone,
        :address,
        :qualification,
        :job_ad_id,
        :documentation
      )
    end

end
