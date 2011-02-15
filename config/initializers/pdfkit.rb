PDFKit.configure do |config|
  config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if ::Rails.env.production?
  config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-mac').to_s if ::Rails.env.development?
end