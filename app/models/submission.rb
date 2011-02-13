class Submission < ActiveRecord::Base
  belongs_to :conference
  belongs_to :user
  
  has_attached_file :image
  
  validates_attachment_content_type :image, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates :title, :authors, :institutions, :body, :user_id, :conference_id, :presence => true
  validates :title, :authors, :institutions, :length => { :maximum => 255 }
  validates :body, :length => { :maximum => 1650 }
  validates :title, :uniqueness => true
  
  before_save :validates_conference_is_accepting_submissions
  
  def pdf_filename
    self.title.gsub(/[^0-9A-Za-z]/, '_') + "_" + Time.now.to_i.to_s
  end
  
  private
  
  def validates_conference_is_accepting_submissions
    errors.add(:conference_id, "is not accepting submissions.") unless
      Conference.find(conference_id).accepting_submissions?
  end
end
