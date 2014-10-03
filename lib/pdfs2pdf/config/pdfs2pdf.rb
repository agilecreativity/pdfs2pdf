module Pdfs2Pdf
  class << self
    # Customize the configuration for specific system (Ubuntu/OSX/etc)
    # See: ./lib/pdfs2pdf/configuration.rb for available options
    def update_config
      Pdfs2Pdf.configure do |_config|
        # Note: add your custom config here
        # config.gs_binary = '/usr/bin/gs'
        #
        # config.default_options = {
        #   paper_size: 'Letter',
        #   ..
        # }
        # config.pdfmarks_meta   = ..
      end
    end
  end
end
