class Conference < ActiveRecord::Base
  has_many :submissions
end
