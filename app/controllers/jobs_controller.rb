class JobsController < ApplicationController

  # the user must be signed in
  # for everything EXCEPT from the index and show (method in ApplicationController)
  before_action :require_user, except: [:index, :show]


  def index
    @jobs = Job.order("stripe_token asc, created_at desc")
    # if i wanted to find all of my jobs
    # it would be :
    # @jobs = current_user.jobs.all
  end


  def show
    # not current_user.jobs because it can be ANYONE'S job
    @job = Job.find(params[:id])
  end


  def new
    # @job = Job.new
	  # because we want the job attached to a user, the above won't work, instead we do this:
    @job = current_user.jobs.new
  end

  def create
    @job = current_user.jobs.new(job_params)

    if @job.save
      flash[:success] = "Job added"
      redirect_to job_path(@job)
    else
      render :new
    end
  end


  def edit
    @job = current_user.jobs.find(params[:id])
  end


  def update
    @job = current_user.jobs.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "Job updated"
      redirect_to job_path(@job)
    else
      render :edit
    end
  end


  def destroy
    @job = current_user.jobs.find(params[:id])
    @job.destroy
    flash[:success] = "Job deleted"
    redirect_to root_path
  end
  

  def job_params
    params.require(:job).permit(:title, :description, :company_name, :company_url, :company_tagline, :location, :phone, :application_deadline, :salary, :company_logo)
  end

end
