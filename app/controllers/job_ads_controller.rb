class JobAdsController < ApplicationController
  def show
    @job_ad = JobAd.find(params[:id])

    unless @job_ad.expired?
      @job_application = JobApplication.new
    end
  end
end
