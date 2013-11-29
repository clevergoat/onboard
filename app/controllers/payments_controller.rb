class PaymentsController < ApplicationController

  before_action :require_user

  def new
  	@job = current_user.jobs.find(params[:job_id])
  end


  def create
  	@job = current_user.jobs.find(params[:job_id])

  	@job.stripe_token = params[:payment][:token]

  	if @job.save
  		# charge this card
  		Stripe::Charge.create(
  			amount: 100, 
  			currency: "gbp", 
  			card: @job.stripe_token, 
  			description: "Job id: #{@job.id}"
  			)

  		flash[:success] = "Your job is now featured"

  	end
	redirect_to job_path(@job)
  end

end
