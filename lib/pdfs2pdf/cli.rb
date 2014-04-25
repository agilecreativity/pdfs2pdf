require 'thor'
require 'tmpdir'
require 'fileutils'
require_relative '../pdfs2pdf'
require_relative './utils'

module Pdfs2Pdf
  include AgileUtils::Options
  include CodeLister
  class CLI < Thor
    desc 'merge', 'Combine multiple pdfs into one file with bookmarks'
    method_option *AgileUtils::Options::BASE_DIR
    method_option *AgileUtils::Options::INC_WORDS
    method_option *AgileUtils::Options::EXC_WORDS
    method_option *AgileUtils::Options::IGNORE_CASE
    method_option *AgileUtils::Options::RECURSIVE
    method_option *AgileUtils::Options::VERSION

    def merge
      pdf_files = CodeLister.files base_dir: options[:base_dir],
                                   exts: %w(pdf),
                                   recursive: true
      create_pdfmarks(pdf_files, options[:base_dir])
      merge_pdfs(pdf_files)
    end

    desc 'usage', 'Display usage information'
    def usage
      puts <<-EOT
Usage:
  pdfs2pdf merge [OPTIONS]

Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: . (current directory)
  -n, [--inc-words=one two three]          # List of words to be included in the result
  -x, [--exc-words=one two three]          # List of words to be excluded from the result
  -i, [--ignore-case], [--no-ignore-case]  # Match case insensitively
                                           # Default: true
  -r, [--recursive], [--no-recursive]      # Search for files recursively
                                           # Default: true
  -v, [--version], [--no-version]          # Display version information

Combine multiple pdfs into one file with bookmarks
      EOT
    end

    default_task :usage

    private

    def create_pdfmarks(page_list, base_dir)
      elapsed = AgileUtils::FileUtil.time do
        Pdfs2Pdf::Utils.create_pdfmarks(page_list, 'pdfmarks', base_dir)
      end
      puts "Create pdfmarks took #{elapsed} ms"
    end

    def merge_pdfs(pdf_files)
      elapsed = AgileUtils::FileUtil.time do
        Pdfs2Pdf::Utils.merge_pdfs(pdf_files, 'pdfmarks', 'final_output.pdf')
      end
      puts "Combine pdf files took #{elapsed} ms"
      puts "Your combine pdf is available at #{File.absolute_path('final_output.pdf')}"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  include Pdfs2Pdf
  # TODO: make it work with File.expand_path('~/Dropbox/ebooks/')
  #  File.expand_path('~') # => '/home/bchoomnuan'
  #  File.expand_path('.') # => '/home/bchoomnuan/.../pdfs2pdf'
end
