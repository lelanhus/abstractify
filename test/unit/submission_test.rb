require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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