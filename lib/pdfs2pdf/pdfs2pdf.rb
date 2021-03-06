module Pdfs2Pdf
  class << self
    # Create the 'pdfmarks' file for use with 'gs' utility
    #
    # @param [Array<String>] pdf_files the input file list (pdf)
    # @param [String] output_file the output filename default to 'pdfmarks'
    # @param [String] base_dir the base directory
    # def create_pdfmarks(pdf_files, pdfmarks_file = "pdfmarks", base_dir = Dir.pwd)
    def create_pdfmarks(pdf_files, pdfmarks_file = "pdfmarks", base_dir)
      FileUtils.chdir(base_dir)
      File.open(pdfmarks_file, "w") do |out_file|
        out_file.write(Pdfs2Pdf.configuration.pdfmarks_meta)
        current_page = 1
        pdf_files.each do |pdf_file|
          out_file.write "[ /Page #{current_page} /Title (#{pdf_file}) /OUT pdfmark\n"
          current_page += page_count(pdf_file)
        end
      end
    end

    # Merge/combine list of pdf files using Ghostscript's `gs` command
    #
    # @param [Array<String>] list input file list
    # @param [String] pdfmarks the pdfmarks file default to 'pdfmarks'
    # @param [String] output_file the output pdf file
    def merge_pdfs(list, pdfmarks = "pdfmarks", output_file = "pdfs2pdf_output.pdf")
      paper_size = Pdfs2Pdf.configuration.default_options[:paper_size]
      gs_binary  = Pdfs2Pdf.configuration.gs_binary
      _stdin, _stderr, status = Open3.capture3(
        gs_binary,
        "-q",
        "-dNOPAUSE",
        "-dBATCH",
        "-sDEVICE=pdfwrite",
        "-sPAPERSIZE=#{paper_size}",
        "-sOutputFile=#{output_file}",
        *list,
        pdfmarks)
      fail "Problem in merge_pdfs" unless status.success?
    end

    # Extract pdf page count using pdf-reader
    #
    # @return [Fixnum] the page count of the given pdf file
    def page_count(pdf_file)
      pdf_file = File.expand_path(pdf_file)
      File.open(pdf_file, "rb") do |io|
        reader = PDF::Reader.new(io)
        return reader.page_count
      end
      fail "Problem getting the page count for #{pdf_file}"
    end
  end
end
