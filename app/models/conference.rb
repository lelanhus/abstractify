class Conference < ActiveRecord::Base
  has_many :submissions
  
  default_scope order('submission_deadline DESC')
  
  scope :accepting_submissions, where("conferences.submission_deadline >= ?", Time.now)
  
  validates :name, :start_date, :end_date, :submission_deadline, :presence => true
  
  def accepting_submissions?
    return true if submission_deadline >= Time.now
    false
  end
  
  def pdf_filename
    self.name.gsub(/[^0-9A-Za-z]/, '_') + "_" + Time.now.to_i.to_s
  end
end


# == Schema Info
#
# Table name: conferences
#
#  id                  :integer         not null, primary key
#  end_date            :date
#  name                :string(255)
#  start_date          :date
#  submission_deadline :datetime
#  created_at          :datetime
#  updated_at          :datetime