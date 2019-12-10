<?xml version="1.0" encoding="utf-8"?>
  
<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <!--** An apostrophe. -->
 <xsl:param name="ut:apos">'</xsl:param>

 <!--** A double quotation. -->
 <xsl:param name="ut:quot">"</xsl:param>

 <!--** A `true` string. -->
 <xsl:param name="ut:true" select="string(true())"/>

 <!--** The string of which meaning is unknown namespace. -->
 <xsl:param name="ut:unknown_namespace">&#x86;-&#x87;</xsl:param>

</xsl:stylesheet>

