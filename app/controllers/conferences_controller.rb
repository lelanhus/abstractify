class ConferencesController < InheritedResources::Base
  actions :index, :download_pdfs
  
  def download_pdfs
    @conference = Conference.find(params[:id])
    pdf = render_to_string(:action => 'all_submissions', :layout => false)
    pdf = PDFKit.new(pdf)
    send_data(pdf.to_pdf, :filename => @conference.pdf_filename)
  end
end
