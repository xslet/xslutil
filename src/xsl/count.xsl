<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template name="ut:count">
  <xsl:param name="string"/>
  <xsl:param name="target"/>
  <xsl:choose>
   <xsl:when test="string-length($string) = 0">0</xsl:when>
   <xsl:when test="string-length($target) = 0">0</xsl:when>
   <xsl:when test="starts-with($string, $target)">
    <xsl:variable name="_count">
     <xsl:variable name="_next_bgn" select="string-length($target) + 1"/>
     <xsl:call-template name="ut:count">
      <xsl:with-param name="string" select="substring($string, $_next_bgn)"/>
      <xsl:with-param name="target" select="$target"/>
     </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$_count + 1"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:call-template name="ut:count">
     <xsl:with-param name="string" select="substring($string, 2)"/>
     <xsl:with-param name="target" select="$target"/>
    </xsl:call-template>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>

