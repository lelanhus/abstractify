module ConferencesHelper
  
  def render_conference(conference)
    return render :partial => 'conference', :locals => { :conference => conference } if conference.accepting_submissions?
    content_tag :li, conference.name
  end
end
