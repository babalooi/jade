class JobApplicationsController < ApplicationController
  before_action :authenticate_user!, except: %i[ create ]

  def index
    @job_applications = JobApplication.all
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_ad = JobAd.find(params[:job_application][:job_ad].to_i)
    @job_application.job_ad = @job_ad
    if @job_application.save
      JobApplicationMailer.with(job_application: @job_application).send_confirmation.deliver_now
    end
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
        :job_ad_id
      )
    end

end
