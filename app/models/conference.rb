class Conference < ActiveRecord::Base
  has_many :submissions
  
  validates :name, :start_date, :end_date, :submission_deadline, :presence => true
end
