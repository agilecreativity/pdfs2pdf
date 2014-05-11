# coding: utf-8
module Pdfs2Pdf
  class << self
    # Customize the configuration for specific system (Ubuntu/OSX/etc)
    # See: ./lib/pdfs2pdf/configuration.rb for available options
    def update_config
      Pdfs2Pdf.configure do |config|
        # Note: add your custom config here
        # config.wkhtmltopdf     = '/usr/bin/wkhtmltopdf'
        # config.default_options = {
        #   paper_size: 'Letter',
        #   ..
        # }
        # config.pdfmarks_meta   = ..
      end
    end
  end
end
