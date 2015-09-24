# PDFDiff

PDFDiff is a command-line tool to compute the differences between two PDF
files.

## Installation

You need [ImageMagick](http://www.imagemagick.org) to use this tool.

To check if you have ImageMagick, run

```bash
which convert
```

or

```bash
which compare
```

Once you are certain that you have ImageMagick, run

```bash
gem install pdfdiff
```

to install PDFDiff.

## Usage

```bash
pdfdiff first.pdf second.pdf result.pdf
```

This command might take a while to run. After it finishes, `result.pdf`
will contain the diff of `first.pdf` and `second.pdf`, with their
differences highlighted.
