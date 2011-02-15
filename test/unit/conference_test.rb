require 'test_helper'

class ConferenceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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