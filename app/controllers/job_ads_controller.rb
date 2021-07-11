class JobAdsController < ApplicationController
  before_action :set_job_ad, only: %i[ show destroy edit update ]

  def index
    @jobs = JobAd.order(:created_at).page params[:page]
  end

  def show
    unless @job_ad.expired?
      @job_application = JobApplication.new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @job_ad.update(job_ad_params)
        format.html { redirect_to @job_ad, notice: "Job application was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_ad.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Job ad was successfully deleted." }
    end
  end

  private

    def set_job_ad
      @job_ad = JobAd.find(params[:id])
    end

    def job_ad_params
      params.require(:job_ad).permit(
        :name,
        :category,
        :deadline,
        :email,
        :phone,
        :address,
        :qualification,
        :description
      )
    end
end
