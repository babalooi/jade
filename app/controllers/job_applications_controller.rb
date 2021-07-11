class JobApplicationsController < ApplicationController
  # before_action :set_job_application, only: %i[ show ]
  before_action :authenticate_user!, except: %i[ create ]

  def index
    @job_applications = JobApplication.all
  end

  # # GET /job_applications/1 or /job_applications/1.json
  # def show
  # end

  # # GET /job_applications/new
  # def new
  #   @job_application = JobApplication.new
  # end

  # # GET /job_applications/1/edit
  # def edit
  # end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_ad = JobAd.find(params[:job_application][:job_ad].to_i)
    @job_application.job_ad = @job_ad
    if @job_application.save
      JobApplicationMailer.with(job_application: @job_application).send_confirmation.deliver_now
    end
  end

  # # PATCH/PUT /job_applications/1 or /job_applications/1.json
  # def update
  #   respond_to do |format|
  #     if @job_application.update(job_application_params)
  #       format.html { redirect_to @job_application, notice: "Job application was successfully updated." }
  #       format.json { render :show, status: :ok, location: @job_application }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @job_application.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /job_applications/1 or /job_applications/1.json
  # def destroy
  #   @job_application.destroy
  #   respond_to do |format|
  #     format.html { redirect_to job_applications_url, notice: "Job application was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_job_application
    #   @job_application = JobApplication.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    # def job_application_params
    #   params.fetch(:job_application, {})
    # end

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
