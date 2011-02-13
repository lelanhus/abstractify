class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show, :download_pdf]
  
  def index
    @submissions = Submission.all
    @grouped_submissions = @submissions.group_by { |t| t.conference }
  end
  
  def download_pdf
    @submission = Submission.find(params[:id])
    pdf = render_to_string(:action => 'pdf', :layout => false)
    pdf = PDFKit.new(pdf)
    send_data(pdf.to_pdf, :filename => @submission.pdf_filename)
  end

  protected
  
  def begin_of_association_chain 
    request.get? ? super : current_user
  end
end
