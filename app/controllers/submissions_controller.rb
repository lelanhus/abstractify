class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]
  belongs_to :conference
end
