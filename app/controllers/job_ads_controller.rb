class JobAdsController < ApplicationController
  def show
    @job_ad = JobAd.find(params[:id])
  end
end
