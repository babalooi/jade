class JobAdsController < ApplicationController
  before_action :set_job_ad, only: %i[ show destroy edit update ]
  before_action :authenticate_user!, except: %i[ show index ]

  def index
    @jobs = JobAd.order(:created_at).page params[:page]
  end

  def show
      @job_application = JobApplication.new unless @job_ad.expired?
  end

  def new
    @job_ad = JobAd.new
  end

  def edit
  end

  def create
    @job_ad = JobAd.new(job_ad_params)

    respond_to do |format|
      if @job_ad.save
        format.html { redirect_to @job_ad, notice: t('controllers.job_ads.create.flash.notice') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_ad.update(job_ad_params)
        format.html { redirect_to @job_ad, notice: t('controllers.job_ads.update.flash.notice') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_ad.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: t('controllers.job_ads.delete.flash.notice') }
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
        :description,
        :company_name,
        :company_email
      )
    end
end
