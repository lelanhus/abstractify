class ConferencesController < InheritedResources::Base
#  actions :index, :download_all_submissions
  
  def download_all_submissions
    @conference = Conference.find(params[:id])
    pdf = render_to_string(:action => 'all_submissions', :layout => false)
    pdf = PDFKit.new(pdf)
    send_data(pdf.to_pdf, :filename => @conference.pdf_filename)
  end
end
