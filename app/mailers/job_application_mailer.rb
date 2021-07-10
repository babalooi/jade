class JobApplicationMailer < ApplicationMailer
  before_action :set_email_data

  def send_confirmation
    mail( to: @job_application.email, subject: "Jade Job Application" )
  end

  private

    def set_email_data
      @job_application = params[:job_application]
    end
end
