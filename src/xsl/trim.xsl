<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <!--**
   Trims target substrings in start of string.
 -->
 <xsl:template name="ut:trim_start">
  <!--** A string to be processed. -->
  <xsl:param name="string"/>
  <!--** A substring to be trimmed. -->
  <xsl:param name="target"/>
  <xsl:variable name="_lenS" select="string-length($string)"/>
  <xsl:variable name="_lenT" select="string-length($target)"/>
  <xsl:choose>
   <xsl:when test="$_lenS = 0"></xsl:when>
   <xsl:when test="$_lenT = 0">
    <xsl:variable name="_first" select="substring($string, 1, 1)"/>
    <xsl:choose>
     <xsl:when test="normalize-space($_first) = ''">
      <xsl:call-template name="ut:trim_start">
       <xsl:with-param name="string" select="substring($string, 2)"/>
      </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="$string"/>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:when>
   <xsl:otherwise>
    <xsl:choose>
     <xsl:when test="starts-with($string, $target)">
      <xsl:call-template name="ut:trim_start">
       <xsl:with-param name="string" select="substring($string, $_lenT + 1)"/>
       <xsl:with-param name="target" select="$target"/>
      </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="$string"/>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <!--**
   Trims target substrings in end of string.
 -->
 <xsl:template name="ut:trim_end">
  <!--** A string to be processed. -->
  <xsl:param name="string"/>
  <!--** A substring to be trimmed. -->
  <xsl:param name="target"/>
  <xsl:variable name="_lenS" select="string-length($string)"/>
  <xsl:variable name="_lenT" select="string-length($target)"/>
  <xsl:choose>
   <xsl:when test="$_lenS = 0"></xsl:when>
   <xsl:when test="$_lenT = 0">
    <xsl:variable name="_last" select="substring($string, $_lenS, 1)"/>
    <xsl:choose>
     <xsl:when test="normalize-space($_last) = ''">
      <xsl:call-template name="ut:trim_end">
       <xsl:with-param name="string"
         select="substring($string, 1, $_lenS - 1)"/>
      </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="$string"/>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:when>
   <xsl:otherwise>
    <xsl:choose>
     <xsl:when test="substring($string, $_lenS - $_lenT + 1) = $target">
      <xsl:call-template name="ut:trim_end">
       <xsl:with-param name="string"
         select="substring($string, 1, $_lenS - $_lenT)"/>
       <xsl:with-param name="target" select="$target"/>
      </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="$string"/>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <!--**
   Trims target substrings in both side of string.
 -->
 <xsl:template name="ut:trim">
  <!--** A string to be processed. -->
  <xsl:param name="string"/>
  <!--** A substring to be trimmed. -->
  <xsl:param name="target"/>
  <xsl:variable name="_str">
   <xsl:call-template name="ut:trim_start">
    <xsl:with-param name="string" select="$string"/>
    <xsl:with-param name="target" select="$target"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:call-template name="ut:trim_end">
   <xsl:with-param name="string" select="$_str"/>
   <xsl:with-param name="target" select="$target"/>
  </xsl:call-template>
 </xsl:template>

</xsl:stylesheet>
