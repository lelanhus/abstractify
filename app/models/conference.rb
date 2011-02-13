class Conference < ActiveRecord::Base
  has_many :submissions
  
  scope :accepting_submissions, where("conferences.submission_deadline <= ?", Time.now)
  
  validates :name, :start_date, :end_date, :submission_deadline, :presence => true
end
