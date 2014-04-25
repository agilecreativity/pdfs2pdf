## Pdfs2Pdf

[![Gem Version](https://badge.fury.io/rb/pdfs2pdf.svg)](http://badge.fury.io/rb/pdfs2pdf)

Combine multiple PDF files into one file with simple bookmarks support.

The gem rely on the power of great opensource projects such as

- [Ghostscript][] - for combining multiple pdf files
- [Wkhtmltopdf][] - for converting file to PDF

and it is built on top of my other gems

- [agile_utils][] gem
- [code_lister][] gem

## What it does?

Says you have the follow pdf files (included inside the test fixtures)

```
./test/fixtures/samples/demo1_xxx.rb.xhtml.pdf
./test/fixtures/samples/demo2_xxx.rb.xhtml.pdf
./test/fixtures/samples/sub_dir/demo3_xxx.rb.xhtml.pdf
./test/fixtures/samples/sub_dir/demo4_xxx.rb.xhtml.pdf
```
Which have the following content:

- File: `./test/fixtures/samples/demo1_xxx.rb.xhtml.pdf`

![](https://github.com/agilecreativity/pdfs2pdf/raw/master/demo1.png)

- File: `./test/fixtures/samples/demo2_xxx.rb.xhtml.pdf`

![](https://github.com/agilecreativity/pdfs2pdf/raw/master/demo2.png)

- File: `./test/fixtures/samples/sub_dir/demo3_xxx.rb.xhtml.pdf`

![](https://github.com/agilecreativity/pdfs2pdf/raw/master/demo3.png)

- File: `./test/fixtures/samples/sub_dir/demo4_xxx.rb.xhtml.pdf`

![](https://github.com/agilecreativity/pdfs2pdf/raw/master/demo4.png)

When you run the following command:

```
gem install pdfs2pdf
git clone https://github.com/agilecreativity/pdfs2pdf.git
cd pdfs2pdf
rbenv local 2.1.1 # if you use rbenv as your ruby manager
rbenv rehash
pdfs2pdf merge --base-dir ./test/fixtures/samples
```

Will produce the result like the following

- File: `final_output.pdf` (excepted screenshot)

![](https://github.com/agilecreativity/pdfs2pdf/raw/master/final_output.png)

- File: `final_output.pdf` (actual pdf)

![](https://github.com/agilecreativity/pdfs2pdf/raw/master/final_output.pdf)

### Requirments

### Mandatory Requirement

- [Ghostscript][]
- [Wkhtmltopdf][]

## Usage

```sh
gem install pdfs2pdf
```
For list of usage type

```sh
pdfs2pdf help
```
Which should give the following options

```
Commands:
  pdfs2pdf help [COMMAND]  # Describe available commands or one specific command
  pdfs2pdf merge           # Combine multiple pdfs into one file with bookmarks
  pdfs2pdf usage           # Display usage information
```

Help on `merge` command just type `pdfs2pdf help merge`.

Which should produce the following guide.

```
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
```

To combine multiple pdfs just try something like

```
pdfs2pdf merge --base-dir ./test/fixtures/samples
```
This will merge all the pdf files from `test/fixtures/samples` and generate the
`final_output.pdf` in the current directory.

### Known Issues

- The directory that contains the pdf files must only contain the
letters, numbers and/or underscore characters. Any other characters like
`-` (dash) may caused the 'pdfmarks' file to produce incorrect bookmarks.

  * Solution: try rename your folder to 'something_with_underscore' but not
    'something-with-dash' before running the command.

### Changelogs

#### 0.0.3

- Update to [agile_utils][] which fix some minor bug

#### 0.0.2

- Fix incorrect version badge

#### 0.0.1

- Initial release

### Contributing

1. Fork it ( http://github.com/agilecreativity/pdfs2pdf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Ghostscript]: http://www.ghostscript.com/
[Wkhtmltopdf]: http://wkhtmltopdf.org/
[agile_utils]: https://github.com/agilecreativity/agile_utils
[code_lister]: https://github.com/agilecreativity/code_lister
