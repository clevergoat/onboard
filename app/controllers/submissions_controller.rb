class SubmissionsController < ApplicationController

  before_action :require_user
  before_action :find_job


  def show
  	@submission = @job.submissions.find(params[:id])
  end


  def create
  	@submission = @job.submissions.new(submission_params)
  	@submission.user = current_user

  	if @submission.save
  		flash[:success] = "You've applied for this job"
  		
      # send out an email detailing your submission
      SubmissionsMailer.new(@submission).deliver

      redirect_to job_path(@job)
  	else
  		render :new
  	end

  end


  def submission_params
  	params.require(:submission).permit(:cover_letter)
  end


  def new
  	@submission = @job.submissions.new
  	@submission.user = current_user
  end


  # find the current job id
  # params[:id] is the ID for the submission not the job
  # params[:job_id] comes from the nested resource in routes.rb
  def find_job
  	@job = Job.find(params[:job_id])
  end


end
