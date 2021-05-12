Docker Container for `slax`
==========================

This is a simple Docker container containing [`slaxproc`](https://github.com/Juniper/libslax). `libslax` hasn't been meaningfully updated for a few years now, so it's pretty difficult to build on modern systems. This container contains a fully-functional build of `slaxproc` so you can easily run it.

About `slax`
------------

`slax` is a C-like syntax for `xslt`. It greatly simplifies the reading and writing of `xslt` files, which can otherwise be quite verbose.

### Example
_From [https://www.w3schools.com/xml/xsl_intro.asp](https://www.w3schools.com/xml/xsl_intro.asp)_

#### `xslt` Version
```xml
 <?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>My CD Collection</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Title</th>
        <th>Artist</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <tr>
          <td><xsl:value-of select="title"/></td>
          <td><xsl:value-of select="artist"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
```

#### `slax` Version
```c
version 1.2;

main <html> {
    <body> {
        <h2> "My CD Collection";
        <table border="1"> {
            <tr bgcolor="#9acd32"> {
                <th> "Title";
                <th> "Artist";
            }

            for-each (catalog/cd) {
                <tr> {
                    <td> title;
                    <td> artist;
                }
            }
        }
    }
}
```

Running
-------
```sh
docker run -i ghcr.io/gucci-on-fleek/slax [slaxproc arguments]
```

### Convert `slax` to `xslt`
```sh
docker run -i ghcr.io/gucci-on-fleek/slax -x < test.slax > test.xslt
```

### Convert `xslt` to `slax`
```sh
docker run -i ghcr.io/gucci-on-fleek/slax -s < test.xslt > test.slax
```

### Usage
```sh
docker run ghcr.io/gucci-on-fleek/slax --help
```
```text
Usage: slaxproc [mode] [options] [script] [files]
    Modes:
        --check OR -c: check syntax and content for a SLAX script
        --format OR -F: format (pretty print) a SLAX script
        --json-to-xml: Turn JSON data into XML
        --run OR -r: run a SLAX script (the default mode)
        --show-select: show XPath selection from the input document
        --show-variable: show contents of a global variable
        --slax-to-xslt OR -x: turn SLAX into XSLT
        --xml-to-json: turn XML into JSON
        --xpath <xpath> OR -X <xpath>: select XPath data from input
        --xslt-to-slax OR -s: turn XSLT into SLAX

    Options:
        --debug OR -d: enable the SLAX/XSLT debugger
        --empty OR -E: give an empty document for input
        --exslt OR -e: enable the EXSLT library
        --expression <expr>: convert an expression
        --help OR -h: display this help message
        --html OR -H: Parse input data as HTML
        --ignore-arguments: Do not process any further arguments
        --include <dir> OR -I <dir>: search directory for includes/imports
        --indent OR -g: indent output ala output-method/indent
        --input <file> OR -i <file>: take input from the given file
        --json-tagging: tag json-style input with the 'json' attribute
        --keep-text: mini-templates should not discard text
        --lib <dir> OR -L <dir>: search directory for extension libraries
        --log <file>: use given log file
        --mini-template <code> OR -m <code>: wrap template code in a script
        --name <file> OR -n <file>: read the script from the given file
        --no-json-types: do not insert 'type' attribute for --json-to-xml
        --no-randomize: do not initialize the random number generator
        --no-tty: do not fall back to stdin for tty io
        --output <file> OR -o <file>: make output into the given file
        --param <name> <value> OR -a <name> <value>: pass parameters
        --partial OR -p: allow partial SLAX input to --slax-to-xslt
        --slax-output OR -S: Write the result using SLAX-style XML (braces, etc)
        --trace <file> OR -t <file>: write trace data to a file
        --verbose OR -v: enable debugging output (slaxLog())
        --version OR -V: show version information (and exit)
        --write-version <version> OR -w <version>: write in version

Project libslax home page: https://github.com/Juniper/libslax
```

License
-------

`libslax` is licensed under the [3-clause BSD licence](libslax/Copyright). The contents of this repository outside of the `libslax/` directory are licensed under the [Mozilla Public Licence, version 2.0](http://mozilla.org/MPL/2.0/) or greater.
