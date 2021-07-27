class JobApplicationCreator
  def initialize(application_params, job_ad_id)
    @job_ad_id = job_ad_id
    @job_application = JobApplication.new(application_params)
  end

  def call
    set_job_ad
    if save
      send_email
    end
    @job_application
  end

  private
    def set_job_ad
      @job_ad = JobAd.find(@job_ad_id)
      @job_application.job_ad = @job_ad
    rescue => e
      Rails.logger.error "Can't set Job Ad because #{e.to_s}"
    end

    def save
      @job_application.save!
    rescue => e
      Rails.logger.error "Can't save Job Application because #{e.to_s}"
    end

    def send_email
      JobApplicationMailer.with(job_application: @job_application).send_confirmation.deliver_now
    end

end
