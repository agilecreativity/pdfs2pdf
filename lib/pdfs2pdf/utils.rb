require 'open3'
require 'fileutils'
require 'pdf-reader'
require_relative '../pdfs2pdf'
module Pdfs2Pdf
  module Utils
    class << self
      # Batch convert to pdf using `wkhtmltopdf` tool
      #
      # @param [Array<String>] files the input file list
      # @param [String] base_dir the base directory
      def to_pdfs(files)
        files.each_with_index do |file, index|
          puts "Convert file #{index + 1} of #{files.size} : #{file}"
          to_pdf(file)
        end
      end

      # Convert '*.xhtml' or '*.html' to pdf
      #
      # @param filename input filename
      def to_pdf(filename)
        # @todo allow the options to be passed in so that we can use different theme
        # '--no-background'
        fail "Invalid input file #{filename}" unless File.exist?(filename)
        command = [
          'wkhtmltopdf',
          '--margin-top 4',
          '--margin-bottom 4',
          '--margin-left 4',
          '--margin-right 4',
          # Note: working correctly but long URL
          '--header-center "[webpage] :: [page]/[topage]"',
          # TODO: not yet working properly
          # "--header-center #{filename.gsub(base_dir,File.basename(base_dir))} \"[page]/[topage]\"",
          # "--header-center #{filename} \"[page]/[topage]\"",
          '--header-spacing 1',
          '--header-font-size 8',
          '--header-line',
          '--footer-spacing 1',
          '--footer-font-size 8',
          '--footer-line',
          "#{filename}",
          "#{filename}.pdf",
          '> /dev/null']
        _stdin, _stderr, status = Open3.capture3(command.join(' '))
        puts "FYI: to_pdf command: #{command.join(' ')}"
        # Note: may be log it and continue
        fail "Problem processing #{filename}" unless status.success?
      end

      # Create the 'pdfmarks' file for use with 'gs' utility
      #
      # @param [Array<String>] pdf_files the input file list (pdf)
      # @param [String] output_file the output filename default to 'pdfmarks'
      # @param [String] base_dir the base directory (TODO: review this code!)
      def create_pdfmarks(pdf_files, pdfmarks_file = 'pdfmarks', base_dir = Dir.pwd)
        File.open(pdfmarks_file, 'w') do |out_file|
          out_file.write(title)
          current_page = 1
          pdf_files.each do |pdf_file|
            filename = if base_dir
                         # remove the base_directory from the full path
                         pdf_file.gsub(base_dir, File.basename(pdf_file))
                       else
                         pdf_file
                       end
            out_file.write "[ /Page #{current_page} /Title (#{filename}) /OUT pdfmark\n"
            current_page += Pdfs2Pdf::Utils.page_count(pdf_file)
          end
        end
      end

      # Simple title for use in 'pdfmarks' file
      #
      # @todo allow the customization.
      def title
        <<-END.gsub(/^\s+\|/, '')
          |[ /Title (My Sample Book)
          |  /Author (Agile Creativity)
          |  /Keywords (fun, witty, interesting)
          |  /DOCINFO pdfmark
        END
      end

      # Merge list of files using 'gs' command
      #
      # @param [Array<String>] list input file list
      # @param [String] pdfmarks the pdfmarks file default to 'pdfmarks'
      # @param [String] output_file the output pdf file
      def merge_pdfs(list, pdfmarks = 'pdfmarks', output_file = 'output.pdf')
        # puts "FYI: merge_pdfs: your list: #{list}"
        _stdin, _stderr, status = Open3.capture3(
          'gs',
          '-q',
          '-dNOPAUSE',
          '-dBATCH',
          '-sDEVICE=pdfwrite',
          '-sPAPERSIZE=a4',
          "-sOutputFile=#{output_file}",
          *list,
          pdfmarks)
        fail 'Problem in merge_pdfs' unless status.success?
      end

      # Extract pdf page count using pdf-reader
      #
      # @return [Fixnum] the page count of the given pdf file
      def page_count(pdf_file)
        File.open(pdf_file, 'rb') do |io|
          reader = PDF::Reader.new(io)
          return reader.page_count
        end
        fail "Problem getting the page count for #{pdf_file}"
      end
    end
  end
end
