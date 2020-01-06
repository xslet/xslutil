# [@xslet/xslutil][repo-url] ![Version][ver-image] [![Github.io][io-image]][io-url] [![MIT License][mit-image]][mit-url]

A set of utilities for XSLT programs on Web browsers.

This program is written in XSLT 1.0.

## Namespace

`xmlns:ut="https://github.com/xslet/2020/xslutil"`

## API

The API document of this program is [here][api-url].

## List

* [`ut:count`](#usage_count)
* [`ut:ends_with`](#usage_ends_with)
* [`ut:get_dir_from_url`](#usage_get_dir_from_url)
* [`ut:get_namespace_uri`](#usage_get_namespace_uri)
* [`ut:get_xsl_url`](#usage_get_xsl_url)
* [`ut:is_absolute_url`](#usage_is_absolute_url)
* [`ut:repeat`](#usage_repeat)
* [`ut:replace`](#usage_replace)
* [`ut:trim`](#usage_trim)
* [`ut:trim_start`](#usage_trim_start)
* [`ut:trim_end`](#usage_trim_end)
* [`ut:validate`](#usage_validate)

## Usage

<a name="usage_count"></a>
### `ut:count`

Counts a *target* substring in a *string*.
This function returns a positive number or zero.

```
<!-- Counts 'AB' in 'ABAABCA' then returns 2 -->
<xsl:call-template name="ut:count">
  <xsl:with-param name="string">ABAABCA</xsl:with-param>
  <xsl:with-param name="target">AB</xsl:with-param>
</xsl:call-template>
```

<a name="usage_ends_with"></a>
### `ut:ends_with`

Tests that a *string* ends with a *suffix* substring.
This function returns `$ut:true` (=`'true'`) or empty.

```
<!-- Tests that 'ABC' ends with 'BC' then return 'true' -->
<xsl:call-template name="ut:ends_with">
  <xsl:with-param name="string">ABC</xsl:with-param>
  <xsl:with-param name="suffix">BC</xsl:with-param>
</xsl:call-template>
```

<a name="usage_get_dir_from_url"></a>
### `ut:get_dir_from_url`

Returns a parent url of *url*.
This function returns a url string or `'.'`.

```
<!-- Returns 'https://domain/dir/' from 'https://domain/dir/file' -->
<xsl:call-template name="ut:get_dir_from_url">
  <xsl:with-param name="url">https://domain/dir/file</xsl:with-param>
</xsl:call-template>
``` 

<a name="usage_get_namespace_uri"></a>
### `ut:get_namespace_uri`

Returns the namespace URI of *prefix*.
This function returns a URI string, or `$ut:unknown_namespace`.

```
<!-- Returns 'https://github.com/xslet/2020/xslbook/util' which is
     the namespace URI of the prefix 'ut'. -->
<xsl:call-template name="ut:get_namespace_uri">
  <xsl:with-param name="prefix">ut</xsl:with-param>
</xsl:call-template>
```

<i>
**NOTE:**
Firefox does not support the XPath's namespace axis: `namespace::*`.
So, on Firefox, this function finds an element using the target namespace then applys `namespace-uri()` to it.
If such an element is not found, this function returns `$ut:unknown_namespace`.
</i>

<a name="usage_get_xsl_url"></a>
### `ut:get_xsl_url`

Returns the XSL URL from the processing instruction or the specified *pi*.

```
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="application/xml" href="https://domain/path/to/file.xsl"?>
...
<!-- Returns 'https://domain/path/to/file.xsl' -->
<xsl:call-template name="ut:get_xsl_url"/>

<!-- Returns 'path/to/file.xsl' -->
<xsl:call-template name="ut:get_xsl_url"/>
  <xsl:with-param name="pi" select='<?xml-stylesheet type="text/xsl" href="path/to/file.xsl"?>'/>
</xsl:call-template>
```

<a name="usage_is_absolute_url"></a>
### `ut:is_absolute_url`

Tests that a *url* string is an absolute URL.
This function returns `$ut:true` (= `'true'`) or empty.

```
<!-- Tests 'https://aaa/bbb/ccc' is absolute, then returns 'true'  -->
<xsl:call-template name="ut:is_absolute_url">
  <xsl:with-param name="url">https://aaa/bbb/ccc</xsl:with-param>
</xsl:call-template>

<!-- Tests 'aaa/bbb/ccc' is absolute, then returns empty  -->
<xsl:call-template name="ut:is_absolute_url">
  <xsl:with-param name="url">aaa/bbb/ccc</xsl:with-param>
</xsl:call-template>
```

<a name="usage_repeat"></a>
### `ut:repeat`

Repeats a *string* *count* times.

```
<!-- Returns 'ABCABCABC' -->
<xsl:call-template name="ut:repeat">
  <xsl:with-param name="string">ABC</xsl:with-param>
  <xsl:with-param name="count">3</xsl:with-param>
</xsl:call-template>
``` 

<a name="usage_replace"></a>
### `ut:replace`

Replaces all *target* substrings to *replacement* in a *string*.

```
<!-- Returns 'AdeAde' -->
<xsl:call-template name="ut:replace">
  <xsl:with-param name="string">ABCABC</xsl:with-param>
  <xsl:with-param name="target">BC</xsl:with-param>
  <xsl:with-param name="target">de</xsl:with-param>
</xsl:call-template>
``` 

<a name="usage_trim"></a>
### `ut:trim`

Trims *target* substrings in both side of *string*.

```
<!-- Returns 'ABC' -->
<xsl:call-template name="ut:trim">
  <xsl:with-param name="string">  ABC   </xsl:with-param>
</xsl:call-template>

<!-- Returns ' ABC ' -->
<xsl:call-template name="ut:trim">
  <xsl:with-param name="string">## ABC ###</xsl:with-param>
  <xsl:with-param name="target">#</xsl:with-param>
</xsl:call-template>
``` 

<a name="usage_trim_start"></a>
### `ut:trim_start`

Trims *target* substrings in start of *string*.

```
<!-- Returns 'ABC   ' -->
<xsl:call-template name="ut:trim_start">
  <xsl:with-param name="string">  ABC   </xsl:with-param>
</xsl:call-template>

<!-- Returns ' ABC ###' -->
<xsl:call-template name="ut:trim_start">
  <xsl:with-param name="string">## ABC ###</xsl:with-param>
  <xsl:with-param name="target">#</xsl:with-param>
</xsl:call-template>
``` 

<a name="usage_trim_end"></a>
### `ut:trim_end`

Trims *target* substrings in end of *string*.

```
<!-- Returns '  ABC' -->
<xsl:call-template name="ut:trim_end">
  <xsl:with-param name="string">  ABC   </xsl:with-param>
</xsl:call-template>

<!-- Returns '## ABC ' -->
<xsl:call-template name="ut:trim_end">
  <xsl:with-param name="string">## ABC ###</xsl:with-param>
  <xsl:with-param name="target">#</xsl:with-param>
</xsl:call-template>
``` 

<a name="usage_validate"></a>
### `ut:validate`

Tests a *string* contains one of character in *forbidden*. If *forbidden* substrings are contained, this function returns a *default* string. Otherwise this function returns the tested *string*. 

```
<!-- Returns 'def' -->
<xsl:call-template name="ut:validate">
  <xsl:with-param name="string">abc</xsl:with-param>
  <xsl:with-param name="forbidden">c</xsl:with-param>
  <xsl:with-param name="default">def</xsl:with-param>
</xsl:call-template>

<!-- Returns 'abc' -->
<xsl:call-template name="ut:validate">
  <xsl:with-param name="string">abc</xsl:with-param>
  <xsl:with-param name="target">z</xsl:with-param>
  <xsl:with-param name="default">def</xsl:with-param>
</xsl:call-template>
``` 


## License

Copyright &copy; 2019-2020 Takayuki Sato

This program is free software under [MIT][mit-url] License.
See the file LICENSE in this distribution for more details.


[repo-url]: https://github.com/xslet/xslutil
[io-image]: https://img.shields.io/badge/HP-github.io-ff8888.svg
[io-url]: https://xslet.github.io/xslutil/
[ver-image]: https://img.shields.io/badge/version-0.1.1-blue.svg
[mit-image]: https://img.shields.io/badge/license-MIT-green.svg
[mit-url]: https://opensource.org/licenses/MIT
[api-url]: https://xslet.github.io/xslutil/api/xslutil.xml
