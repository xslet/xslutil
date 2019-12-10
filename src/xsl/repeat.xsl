<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <!--**
   Repeats a string count times.
 -->
 <xsl:template name="ut:repeat">
  <!--** A repeated string. -->
  <xsl:param name="string"/>
  <!--** A number of times to repeat. -->
  <xsl:param name="count"/>
  <xsl:if test="$count &gt; 0">
   <xsl:value-of select="$string"/>
   <xsl:call-template name="ut:repeat">
    <xsl:with-param name="string" select="$string"/>
    <xsl:with-param name="count" select="$count - 1"/>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>

</xsl:stylesheet>
