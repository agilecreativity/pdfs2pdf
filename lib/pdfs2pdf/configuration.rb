# coding: utf-8
module Pdfs2Pdf
  class Configuration
    attr_accessor :default_options,
                  :pdfmarks_meta,
                  :gs_binary

    def initialize
      # see: http://wkhtmltopdf.org/usage/wkhtmltopdf.txt
      @default_options = {
        paper_size: 'A4', # 'Letter'
        # Note: placeholder values, will be added in the up coming release!
        margin_top: '0.75in',
        margin_right: '0.75in',
        margin_bottom: '0.75in',
        margin_left: '0.75in',
        encoding: 'UTF-8'
      }

      # see: http://partners.adobe.com/public/developer/en/acrobat/sdk/pdf/pdf_creation_apis_and_specs/pdfmarkReference.pdf
      @pdfmarks_meta = <<-END.gsub(/^\s+\|/, '')
        |[ /Title (My Combined Pdf)
        |  /Author (Burin Choomnuan)
        |  /Keywords (fun, witty, interesting)
        |  /DOCINFO pdfmark
      END

      @gs_binary = (defined?(Bundler::GemfileError) ? `bundle exec which gs` : `which gs`).chomp
    end
  end

  class << self
    attr_accessor :configuration

    # Configure Pdfs2Pdf someplace sensible, like
    # config/initializers/pdfs2pdf.rb
    #
    # @example
    #
    # Pdfs2pdf.configure do |config|
    #   # set the path to wkhtmltopdf
    #   config.gs_binary = '/usr/bin/gs'
    # end
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
