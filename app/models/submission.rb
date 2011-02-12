class Submission < ActiveRecord::Base
  belongs_to :conference
  belongs_to :user
  
  has_attached_file :image
end
