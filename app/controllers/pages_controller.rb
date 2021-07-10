class PagesController < ApplicationController
  def index
    @jobs = JobAd.all
  end
end
