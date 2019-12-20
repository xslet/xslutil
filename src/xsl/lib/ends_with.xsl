<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <!--**
   Tests that a string ends with a suffix substring. This function returns $ut:true (='true') or empty.
 -->
 <xsl:template name="ut:ends_with">
  <!--** A string to be tested. -->
  <xsl:param name="string"/>
  <!--** A suffix substring. -->
  <xsl:param name="suffix"/>
  <xsl:variable name="_len1" select="string-length($suffix)"/>
  <xsl:choose>
   <xsl:when test="$_len1 = 0">
    <xsl:value-of select="$ut:true"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:variable name="_len0" select="string-length($string)"/>
    <xsl:variable name="_len2" select="$_len0 - $_len1"/>
    <xsl:variable name="_ends" select="substring($string, $_len2 + 1)"/>
    <xsl:if test="$_ends = $suffix">
     <xsl:value-of select="$ut:true"/>
    </xsl:if>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
