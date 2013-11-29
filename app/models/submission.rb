class Submission < ActiveRecord::Base

	belongs_to :user	
	belongs_to :job

	validates :cover_letter, presence: true

	# from paperclip
	has_attached_file :cv

end
