<?xml version="1.0" encoding="utf-8"?>
<!-- This file is part of the DITA Open Toolkit project.
     See the accompanying license.txt file for applicable licenses. -->
<!-- (c) Copyright Suite Solutions -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="2.0"
                exclude-result-prefixes="xs">

  <xsl:param name="locale"/>
  <xsl:param name="customizationDir.url"/>
  <xsl:param name="artworkPrefix"/>
  <xsl:param name="publishRequiredCleanup"/>
  <xsl:param name="DRAFT"/>
  <xsl:param name="output.dir.url"/>
  <xsl:param name="work.dir.url"/>
  <xsl:param name="input.dir.url"/>
  <xsl:param name="pdfFormatter" select="'fop'"/>
  <xsl:param name="antArgsGenerateTaskLabels"/>
  <xsl:param name="tocMaximumLevel" select="4"/>

  <xsl:param name="antArgsBookmarkStyle"/>
  <!-- Values are COLLAPSED or EXPANDED. If a value is passed in from Ant, use that value. -->
  <xsl:variable name="bookmarkStyle" select="if (normalize-space($antArgsBookmarkStyle)) then $antArgsBookmarkStyle else 'COLLAPSE'"/>

  <!-- Determine how to style topics referenced by <chapter>, <part>, etc. Values are:
         MINITOC: render with a MiniToc on left, content indented on right.
         BASIC: render the same way as any topic. -->
  <xsl:param name="antArgsChapterLayout"/>
  <xsl:variable name="chapterLayout" select="if (normalize-space($antArgsChapterLayout)) then $antArgsChapterLayout else 'MINITOC'"/>

  <xsl:param name="appendixLayout" select="$chapterLayout"/>
  <xsl:param name="appendicesLayout" select="$chapterLayout"/>
  <xsl:param name="partLayout" select="$chapterLayout"/>
  <xsl:param name="noticesLayout" select="$chapterLayout"/>

  <!-- list of supported link roles -->
  <xsl:param name="include.rellinks"/>
  <xsl:variable name="includeRelatedLinkRoles" select="tokenize(normalize-space($include.rellinks), '\s+')" as="xs:string*"/>

  <!-- #AND Changed to A4 -->
  <xsl:variable name="page-width">210mm</xsl:variable>
  <xsl:variable name="page-height">297mm</xsl:variable>

  <!--  #AND 
  Reduced to 18.4 post meeting on 01112016
  -->
  <xsl:variable name="page-margins">18.4mm</xsl:variable>

  <!-- Change these if your page has different margins on different sides. -->
  <xsl:variable name="page-margin-inside" select="$page-margins"/>
  <xsl:variable name="page-margin-outside" select="$page-margins"/>
  <xsl:variable name="page-margin-top" select="$top-margin"/>
  <xsl:variable name="page-margin-bottom" select="$top-margin"/>
    <!-- #AND added parameters for specifying front matter margins -->
  <!-- #AND values fed to layout-masters-attr.xsl -->
  <xsl:variable name="page-margin-outside-front" select="$page-margins"/>
  <xsl:variable name="page-margin-top-front">10mm</xsl:variable>
  <xsl:variable name="page-margin-bottom-front" select="$page-margins"/>
  <!-- #AND adding body-margin
  Reduced from 28.4 to 18.4 post meeting on 01112016
  -->
  <xsl:variable name="body-margin">18.4mm</xsl:variable>
  
  <!-- #AND adding top-margin
  -->
  <xsl:variable name="top-margin">28.4mm</xsl:variable>
  

  <!--The side column width is the amount the body text is indented relative to the margin. -->
  <xsl:variable name="side-col-width">6mm</xsl:variable>

  <xsl:variable name="mirror-page-margins" select="true()"/>

  <xsl:variable name="default-font-size">10pt</xsl:variable>
  <xsl:variable name="default-line-height">12pt</xsl:variable>

  <xsl:variable name="generate-front-cover" select="true()"/>
  <xsl:variable name="generate-back-cover" select="false()"/>
  <xsl:variable name="generate-toc" select="true()"/>
  
</xsl:stylesheet>
