<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <!--**
   Tests a string contains one of character in forbidden. If forbidden substrings are contained, this function returns a default string. Otherwise this function returns the tested string.
 -->
 <xsl:template name="ut:validate">
  <!--** A string to be tested. -->
  <xsl:param name="string"/>
  <!--** A character set to be forbidden. -->
  <xsl:param name="forbidden"/>
  <!--** A default string if a tested string contains one of forbidden characters. -->
  <xsl:param name="default"/>
  <xsl:variable name="_s" select="translate($string, $forbidden, '')"/>
  <xsl:choose>
   <xsl:when test="string-length($_s) = string-length($string)">
    <xsl:value-of select="$string"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$default"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
