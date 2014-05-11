# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdfs2pdf/version'

Gem::Specification.new do |spec|
  spec.name          = 'pdfs2pdf'
  spec.version       = Pdfs2Pdf::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = %q(Combine multiple pdfs into one pdf with proper bookmarks for easy navigation)
  spec.description   = %q(Combine multiple pdfs into a single file with bookmarks for easy navigation)
  spec.homepage      = 'https://github.com/agilecreativity/pdfs2pdf'
  spec.license       = 'MIT'
  spec.files         = Dir.glob('{bin,lib,config}/**/*') + %w(Gemfile
                                                              Rakefile
                                                              pdfs2pdf.gemspec
                                                              README.md
                                                              CHANGELOGS.md
                                                              LICENSE
                                                              .rubocop.yml
                                                              .gitignore
                                                              rubocop-todo.yml)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob('{test}/**/*')
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'agile_utils', '~> 0.0.9'
  spec.add_runtime_dependency 'code_lister', '~> 0.0.9'
  spec.add_runtime_dependency 'pdf-reader', '~> 1.3.3'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'guard-minitest', '~> 2.2'
  spec.add_development_dependency 'minitest', '~> 5.3'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0.3'
  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rubocop', '~> 0.20'
  spec.add_development_dependency 'yard', '~> 0.8'
end
