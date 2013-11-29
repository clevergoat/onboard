class AddAttachmentCvToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :cv
    end
  end

  def self.down
    drop_attached_file :submissions, :cv
  end
end
