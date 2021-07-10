# Preview all emails at http://localhost:3000/rails/mailers/job_application_mailer
class JobApplicationMailerPreview < ActionMailer::Preview
  def send_confirmation
    JobApplicationMailer.with(job_application: JobApplication.first).send_confirmation
  end

end
