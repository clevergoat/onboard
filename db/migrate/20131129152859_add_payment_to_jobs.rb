class AddPaymentToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :stripe_token, :string
  end
end
