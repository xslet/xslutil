<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template name="ut:get_namespace_uri">
  <xsl:param name="prefix"/>
  <xsl:variable name="_ns" select="namespace::*[name() = $prefix]"/>
  <xsl:choose>
   <xsl:when test="string-length($_ns) &gt; 0">
    <xsl:value-of select="$_ns"/>
   </xsl:when>
   <xsl:otherwise>
    <!-- Because Firefox does not support namespace axis -->
    <xsl:variable name="_ns2"
      select="namespace-uri(//*[name() = concat($prefix,':',local-name())])"/>
    <xsl:choose>
     <xsl:when test="string-length($_ns2) &gt; 0">
      <xsl:value-of select="$_ns2"/>
     </xsl:when>
     <xsl:when test="string-length($prefix) &gt; 0">
      <xsl:value-of select="$ut:unknown_namespace"/>
     </xsl:when>
    </xsl:choose>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
