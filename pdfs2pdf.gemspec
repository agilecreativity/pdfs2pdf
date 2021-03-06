# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pdfs2pdf/version"
Gem::Specification.new do |spec|
  spec.name          = "pdfs2pdf"
  spec.version       = Pdfs2Pdf::VERSION
  spec.authors       = ["Burin Choomnuan"]
  spec.email         = ["agilecreativity@gmail.com"]
  spec.summary       = %q(Combine multiple pdf files into a single pdf with combined table of content for quick navigation)
  spec.description   = %q(Combine multiple pdf files into a single file with combined table of content for quick navigation)
  spec.homepage      = "https://github.com/agilecreativity/pdfs2pdf"
  spec.required_ruby_version = ">= 1.9.3"
  spec.license       = "MIT"
  spec.files         = Dir.glob("{bin,lib}/**/*") + %w[Gemfile
                                                       Rakefile
                                                       pdfs2pdf.gemspec
                                                       README.md
                                                       CHANGELOG.md
                                                       LICENSE
                                                       .rubocop.yml
                                                       .gitignore]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob("{test}/**/*")
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "thor", "~> 0.19"
  spec.add_runtime_dependency "agile_utils", "~> 0.3"
  spec.add_runtime_dependency "code_lister", "~> 0.2"
  spec.add_runtime_dependency "pdf-reader", "~> 1.3"
  spec.add_development_dependency "awesome_print", "~> 1.2"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "gem-ctags", "~> 1.0"
  spec.add_development_dependency "guard-minitest", "~> 2.3"
  spec.add_development_dependency "minitest", "~> 5.4"
  spec.add_development_dependency "minitest-spec-context", "~> 0.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rubocop", "~> 0.53"
  spec.add_development_dependency "yard", "~> 0.9"
end
