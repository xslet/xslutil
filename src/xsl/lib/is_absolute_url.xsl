<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <!--**
   Tests that a url string is an absolute URL. This function returns $ut:true (= 'true') or empty.
 -->
 <xsl:template name="ut:is_absolute_url">
  <!--** An URL string. -->
  <xsl:param name="url"/>
  <xsl:choose>
   <xsl:when test="string-length($url) = 0">
    <xsl:value-of select="$ut:true"/>
   </xsl:when>
   <xsl:when test="contains($url, ':')">
    <xsl:value-of select="$ut:true"/>
   </xsl:when>
   <xsl:when test="starts-with($url, '/')">
    <xsl:value-of select="$ut:true"/>
   </xsl:when>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
