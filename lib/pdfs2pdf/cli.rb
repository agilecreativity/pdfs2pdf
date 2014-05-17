# coding: utf-8
require "thor"
require "tmpdir"
require "fileutils"
require_relative "./pdfs2pdf"
require_relative "../pdfs2pdf"
module Pdfs2Pdf
  include AgileUtils::Options
  include CodeLister
  class CLI < Thor
    desc "merge", "Combine multiple pdfs into one file with bookmarks"
    # method_option *AgileUtils::Options::BASE_DIR
    method_option *AgileUtils::Options::RECURSIVE
    method_option *AgileUtils::Options::VERSION

    def merge
      opts = options.symbolize_keys
      if opts[:version]
        puts "You are using Pdfs2Pdf version #{Pdfs2Pdf::VERSION}"
        exit
      end
      base_dir = File.expand_path(Dir.pwd)
      pdf_files = CodeLister.files base_dir:  base_dir,
                                   exts:      %w[pdf],
                                   recursive: true
      create_pdfmarks(pdf_files, base_dir)
      merge_pdfs(pdf_files)
    end

    desc "usage", "Display usage information"
    def usage
      puts <<-EOT
Usage:
  pdfs2pdf
Options:
  -r, [--recursive], [--no-recursive]      # Search for files recursively
  -v, [--version], [--no-version]          # Display version information
Combine multiple pdfs into one file with bookmarks
      EOT
    end

    default_task :usage

  private

    def create_pdfmarks(page_list, base_dir)
      elapsed = AgileUtils::FileUtil.time do
        Pdfs2Pdf.create_pdfmarks(page_list, "pdfmarks", base_dir)
      end
      puts "Create pdfmarks took #{elapsed} ms"
    end

    def merge_pdfs(pdf_files)
      elapsed = AgileUtils::FileUtil.time do
        Pdfs2Pdf.merge_pdfs(pdf_files, "pdfmarks", "pdfs2pdf_output.pdf")
      end
      puts "Combine pdf files took #{elapsed} ms"
      puts "Your combined pdf is available at #{File.absolute_path("pdfs2pdf_output.pdf")}"
    end
  end
end
