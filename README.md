## pdfs2pdf

[![Gem Version](https://badge.fury.io/rb/pdfs2pdf.svg)](http://badge.fury.io/rb/pdfs2pdf)
[![Dependency Status](https://gemnasium.com/agilecreativity/pdfs2pdf.png)](https://gemnasium.com/agilecreativity/pdfs2pdf)
[![Code Climate](https://codeclimate.com/github/agilecreativity/pdfs2pdf.png)](https://codeclimate.com/github/agilecreativity/pdfs2pdf)

Combine multiple PDF files into a single pdf file with combine table of centent using [Ghostscript][].

### What it does?

Says you have the follow pdf files

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
cd ./test/fixtures/samples
pdfs2pdf --recursive
```

Will produce the result like the following

- File: `pdfs2pdf_samples.pdf` (excepted screenshot)

![](https://github.com/agilecreativity/pdfs2pdf/raw/master/final_output.png)

### Requirements

### Mandatory Requirement

[Ghostscript][]

- Please follow the instruction [here](http://ghostscript.com/doc/current/Install.htm) for
installation from source.

- Alternatively, for Ubuntu you can try `sudo apt-get install ghostscript` and under OSX
you can use [Homebrew](https://github.com/Homebrew/homebrew).

### Usage

```sh
gem install pdfs2pdf
```

### Usage/Synopsis:

```
Usage:
  pdfs2pdf

Options:
  -b, [--base-dir=BASE_DIR]            # Base directory
                                       # Default: . (current directory)
  -r, [--recursive], [--no-recursive]  # Search for files recursively
                                       # Default: true
  -v, [--version], [--no-version]      # Display version information

Combine multiple pdfs into one file with bookmarks
```

To combine multiple pdfs just try something like

```
cd ./test/fixtures/samples
pdfs2pdf -r
```

This will merge all the pdf files from `test/fixtures/samples` and generate the
`pdfs2pdf_samples.pdf`.

### Known Issues

- The combined bookmarks sometime does not produce the correct links to page number.
Currently I am not sure what the workaround is. I love to hear from you if
know more about the 'pdfmarks' format and how it works with the bookmarks.

- The directory that contains the pdf files must only contain the
letters, numbers and/or underscore characters. Any other characters like
`-` (dash) may caused the 'pdfmarks' file to produce incorrect bookmarks.

  * Solution: try rename your folder to 'something_with_underscore' but not
    'something-with-dash' before running the command.

### Contributing

1. Fork it ( http://github.com/agilecreativity/pdfs2pdf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Ghostscript]: http://www.ghostscript.com/
[Semantic Versioning]: http://semver.org
