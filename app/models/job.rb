class Job < ActiveRecord::Base

	belongs_to :user
	has_many :submissions

	validates :title, presence: true, length: { minimum: 5 }
	validates :description, presence: true
	validates :company_name, presence: true
	validates :company_tagline, presence: true
	validates :location, presence: true

	geocoded_by :location
	after_validation :geocode

	has_attached_file :company_logo, styles: { large: "300x300#", medium: "100x100#" }
end


