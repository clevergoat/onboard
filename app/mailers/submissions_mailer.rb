class SubmissionsMailer < ActionMailer::Base
  default from: "rikard@onboard.com"

  def new(submission)
    # share the variable that comes in with the text email
    @submission = submission

    mail to: @submission.job.user.email, subject: "New submission from #{@submission.user.name}"
  end

end