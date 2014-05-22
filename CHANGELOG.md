### Changelogs

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
