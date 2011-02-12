class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]

  protected
  
  def begin_of_association_chain 
    request.get? ? super : current_user
  end
end
