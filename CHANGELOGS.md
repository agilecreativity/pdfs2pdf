### Changelogs

#### 0.0.8

- Add the 'gs_binary' to configurable options in `config/initializers/pdfs2pdf.rb`
- Remove the 'gs_binary' from configurable options in `config/initializers/pdfs2pdf.rb`
- Improve README.md
- Add the missing 'awesome_print' from gemspec file

#### 0.0.7

- Simplify the api by removing some of the options
  * --inc-words
  * --exc-words
  * --ignorecase
- Rename 'utils.rb' to 'pdfs2pdf.rb'
- Update gemspec
- Misc cleanup

#### 0.0.6

- Allow options for wkhtmltopdf to be more customizable
  * page_size: 'A4', 'Letter' can be set via configuration
  * path to the 'wkhtmltopdf' can be set via configuration
  * the 'pdfmarks metadata' can be set via configuration
  * more options will be enabled in upcoming release
- Remove the changelogs section from README.md to CHANGLOGS.md

#### 0.0.5

- Update to latest dependencies
- Add links to CodeClimate and Gemnasium

#### 0.0.4

- Remove unused codes
- Update [agile_utils][] to 0.0.8
- Update [code_lister][] to 0.0.7

#### 0.0.3

- Update to [agile_utils][] which fix some minor bug

#### 0.0.2

- Fix incorrect version badge

#### 0.0.1

- Initial release

[Ghostscript]: http://www.ghostscript.com/
[Wkhtmltopdf]: http://wkhtmltopdf.org/
