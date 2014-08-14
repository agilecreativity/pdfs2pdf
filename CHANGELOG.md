### Changelogs

#### 0.2.2

- Support ruby version 1.9.3+

#### 0.2.1

- Make ruby 2.1.0+ a mandatory

#### 0.2.0

- Use refinement instead of monkeypatching core class
- Update dependency gems to the latest version
- Minor code cleanup

#### 0.1.6

- Make sure that the index file is the first item in the list for nicer output
- Don't include the combined in the output file on subsequent run

#### 0.1.5

- Improve the README.md
  * Update the limitation issue to reflect the bug fix in 0.1.4

#### 0.1.4

- Exclude the output file from the input list if any
  * The input folder with '-' (dash) string should now work without any problem.

#### 0.1.3

- Use `pdfs2pdf_<base_name>.pdf` as output file
- Update `rubocop` to 0.23.x version
- Update rubocop style rule in .rubocop.yml

#### 0.1.2

- Re-instate the `--base-dir` option and make relative path work correctly
- Respect the `--recursive` option
- Minor code cleanup

#### 0.1.1

- Simplify the CLI interface
  * remove `--base-dir` as it must always be the current directory
  * remove the intermediate command in the `bin/pdfs2pdf`
- Cleanup the style with rubocop
- Make `--version` work properly

#### 0.1.0

- First [Semantic Versioning][] version
- Update gemspec file

#### 0.0.1 - 0.0.8

- Releases that do not follow Semantic Versioning
- Implement new features and fix a few bugs a long the way

[Ghostscript]: http://www.ghostscript.com/
[Wkhtmltopdf]: http://wkhtmltopdf.org/
[Semantic Versioning]: http://semver.org/
