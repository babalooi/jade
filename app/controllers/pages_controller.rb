class PagesController < ApplicationController
  def index
    @jobs = JobAd.order(:created_at).page params[:page]
  end
end
