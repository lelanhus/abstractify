class Submission < ActiveRecord::Base
  belongs_to :conference
  belongs_to :user
  
  has_attached_file :image
  
  validates_attachment_content_type :photo, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates :title, :authors, :instituitions, :body, :user_id, :conference_id, :presence => true
  validates :title, :authors, :institutions, :length => { :maximum => 255 }
  validates :body, :length => { :maximum => 1650 }
  validates :title, :uniqueness => true
end
