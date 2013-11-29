class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

    	t.string :title
    	t.text :description
    	
    	t.string :company_name
    	t.string :company_url
    	t.text :company_tagline


    	t.string :location
    	t.float :latitude
    	t.float :longitude

    	t.string :phone
    	t.string :salary
    	t.string :application_deadline

    	t.integer :user_id

      	t.timestamps
    end
  end
end
