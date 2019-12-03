<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template name="ut:replace">
  <xsl:param name="string"/>
  <xsl:param name="target"/>
  <xsl:param name="replacement"/>
  <xsl:variable name="_lenT" select="string-length($target)"/>
  <xsl:choose>
   <xsl:when test="$_lenT = 0">
    <xsl:value-of select="$string"/>
   </xsl:when>
   <xsl:when test="starts-with($string, $target)">
    <xsl:value-of select="$replacement"/>
    <xsl:call-template name="ut:replace">
     <xsl:with-param name="string" select="substring($string, $_lenT + 1)"/>
     <xsl:with-param name="target" select="$target"/>
     <xsl:with-param name="replacement" select="$replacement"/>
    </xsl:call-template>
   </xsl:when>
   <xsl:otherwise>
    <xsl:variable name="_before" select="substring-before($string, $target)"/>
    <xsl:choose>
     <xsl:when test="$_before = ''">
      <xsl:value-of select="$string"/>
     </xsl:when>
     <xsl:otherwise>
      <xsl:variable name="_lenB" select="string-length($_before)"/>
      <xsl:variable name="_posA" select="$_lenB + $_lenT + 1"/>
      <xsl:value-of select="$_before"/>
      <xsl:value-of select="$replacement"/>
      <xsl:call-template name="ut:replace">
       <xsl:with-param name="string" select="substring($string, $_posA)"/>
       <xsl:with-param name="target" select="$target"/>
       <xsl:with-param name="replacement" select="$replacement"/>
      </xsl:call-template>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
