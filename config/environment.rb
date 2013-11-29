# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Onboard::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app19889379@heroku.com'],
  :password       => ENV['vn9tyibv'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}