class Conference < ActiveRecord::Base
  has_many :submissions
  
  default_scope order('submission_deadline DESC')
  
  scope :accepting_submissions, where("conferences.submission_deadline >= ?", Time.now)
  
  validates :name, :start_date, :end_date, :submission_deadline, :presence => true
  
  def accepting_submissions?
    return true if submission_deadline >= Time.now
    false
  end
end
