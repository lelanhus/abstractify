class SubmissionsController < InheritedResources::Base
  before_filter :authenticate_user!
      
  def index
    if current_user.admin?
      @submissions = Submission.all
    else
      @submissions = current_user.submissions
    end
    
    @grouped_submissions = @submissions.group_by { |t| t.conference }
  end
  
  def download_pdf
    @submission = Submission.find(params[:id])
    pdf = render_to_string(:action => 'download_pdf', :layout => false)
    pdf = PDFKit.new(pdf)
    send_data(pdf.to_pdf, :filename => @submission.pdf_filename)
  end

  protected

  def begin_of_association_chain 
    request.get? ? super : current_user
  end
end
