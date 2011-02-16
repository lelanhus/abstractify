class Submission < ActiveRecord::Base
  belongs_to :conference
  belongs_to :user
  
  has_attached_file :image, :styles => { :pdf => "380x380>" }
  
  process_in_background :image
  
  validates_attachment_content_type :image, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif']
                                    
  validates :image_file_name, :format => { :with => /^[a-zA-Z-0-9]\S*$/ }, :if => :has_image?
  validates :title, :authors, :institutions, :body, :user_id, :conference_id, :presence => true
  validates :title, :authors, :institutions, :length => { :maximum => 255 }
  validates :body, :length => { :maximum => 1650 }
  validates :title, :uniqueness => true
  
  before_save :validates_conference_is_accepting_submissions
  
  attr_protected :user_id
  
  def pdf_filename
    self.title.gsub(/[^0-9A-Za-z]/, '_') + "_" + Time.now.to_i.to_s
  end
  
  def has_image?
    !image_file_name.nil?
  end
  
  private
  
  def validates_conference_is_accepting_submissions
    errors.add(:conference_id, "is not accepting submissions.") unless
      Conference.find(conference_id).accepting_submissions?
  end
end


# == Schema Info
#
# Table name: submissions
#
#  id                 :integer         not null, primary key
#  conference_id      :integer
#  user_id            :integer
#  authors            :string(255)
#  body               :text
#  image_content_type :string(255)
#  image_file_name    :string(255)
#  image_file_size    :integer
#  institutions       :string(255)
#  title              :string(255)
#  created_at         :datetime
#  image_updated_at   :datetime
#  updated_at         :datetime