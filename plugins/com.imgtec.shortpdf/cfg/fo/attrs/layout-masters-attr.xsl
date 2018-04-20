<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA Open Toolkit project.
  See the accompanying license.txt file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="2.0">
    
  <xsl:attribute-set name="simple-page-master">
    <xsl:attribute name="page-width">
      <xsl:value-of select="$page-width"/>
    </xsl:attribute>
    <xsl:attribute name="page-height">
      <xsl:value-of select="$page-height"/>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!-- legacy attribute set - #AND also feeds into current attr set -->
  <xsl:attribute-set name="region-body" use-attribute-sets="region-body.odd"/>
  
  <!-- #AND special set for first page in shortpdf -->
  <xsl:attribute-set name="region-body.first" use-attribute-sets="region-body.odd">
    <xsl:attribute name="margin-top">
      32mm
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$top-margin"/>
    </xsl:attribute>
   
  </xsl:attribute-set> 



  <!-- #AND changed body margin -->
  <xsl:attribute-set name="region-body.odd">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$top-margin"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$top-margin"/>
    </xsl:attribute>
   <!-- <xsl:attribute name="background-color">#CCCCCC</xsl:attribute> -->
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:value-of select="$page-margin-inside"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:value-of select="$page-margin-outside"/>
    </xsl:attribute>
  </xsl:attribute-set>
  
  
  <!-- #AND template for the disclaimer.  -->
   <xsl:attribute-set name="__blankpage_disclaimer">
        <xsl:attribute name="font-size">14pt</xsl:attribute>
	<xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>
<!-- #AND container attributes for the disclaimer.  -->    
    <xsl:attribute-set name="__blankpage_disclaimer__container">
        <xsl:attribute name="position">absolute</xsl:attribute>
        <xsl:attribute name="top">100mm</xsl:attribute>
        <xsl:attribute name="bottom">20mm</xsl:attribute>
        <xsl:attribute name="right">20mm</xsl:attribute>
        <xsl:attribute name="left">20mm</xsl:attribute>
    </xsl:attribute-set>

  <xsl:attribute-set name="region-body.even">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$top-margin"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$top-margin"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:value-of select="$page-margin-outside"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:value-of select="$page-margin-inside"/>
    </xsl:attribute>
  </xsl:attribute-set>
  
<!-- #AND first page footer container attributes  -->
	<xsl:attribute-set name="__firstpage__footer__container" use-attribute-sets="footer">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="padding">1pt</xsl:attribute>
		<xsl:attribute name="bottom">0</xsl:attribute>
		<xsl:attribute name="top">0mm</xsl:attribute>
		<xsl:attribute name="left">18.4mm</xsl:attribute>
		<xsl:attribute name="right">8.4mm</xsl:attribute>
			
		<xsl:attribute name="padding-bottom">0</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set> 
	
	<!-- #AND logo container attributes  for short doc logo   
	
			<xsl:attribute name="height" select="$logo-height"/>
		<xsl:attribute name="width" select="$logo-width"/>
	<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
		<xsl:attribute name="content-height">100%</xsl:attribute>
		-->
	<xsl:attribute-set name="__shortpdf__logo__block">
		<xsl:attribute name="width">40mm</xsl:attribute>
		<xsl:attribute name="scaling">uniform</xsl:attribute>
	</xsl:attribute-set> 
	

	<!-- #AND logo container attributes  for short doc logo  <xsl:value-of select="$body-margin + $width"/>-->
	<xsl:attribute-set name="__shortpdf__logo__container">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="padding">1pt</xsl:attribute>
		<xsl:attribute name="top">14mm</xsl:attribute>
		<xsl:attribute name="left">150mm</xsl:attribute>
			
	</xsl:attribute-set> 


<!-- #AND first page header container attributes <xsl:value-of select="$top-margin"/>-->
	<xsl:attribute-set name="__firstpage__header__container">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="padding">1pt</xsl:attribute>
		<xsl:attribute name="top">14.2mm</xsl:attribute>
		<xsl:attribute name="left" select="$page-margin-inside"/>
		<xsl:attribute name="right" select="$page-margin-outside"/>
		
		
	</xsl:attribute-set> 

  
  <xsl:attribute-set name="region-body__frontmatter.odd" use-attribute-sets="region-body.odd">
	    <!-- #AND adding variables for front matter margin values -->
	  <xsl:attribute name="margin-top">
		  <xsl:value-of select="$page-margin-top-front"/>
		</xsl:attribute>
	  <xsl:attribute name="margin-bottom">
		<xsl:value-of select="$page-margin-bottom-front"/> 
		</xsl:attribute>
	<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
	      <xsl:value-of select="$page-margin-inside"/>
	    </xsl:attribute>
	    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
	      <xsl:value-of select="$page-margin-outside-front"/>
	    </xsl:attribute>
	    
	    
	    
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-body__frontmatter.even" use-attribute-sets="region-body.even">
  	    <!-- #AND adding variables for front matter margin values -->
	  <xsl:attribute name="margin-top">
		<xsl:value-of select="$page-margin-top-front"/>
		</xsl:attribute>
	  <xsl:attribute name="margin-bottom">
		<xsl:value-of select="$page-margin-bottom-front"/>
		</xsl:attribute>
	<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
	      <xsl:value-of select="$page-margin-inside"/>
	    </xsl:attribute>
	    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
	      <xsl:value-of select="$page-margin-outside-front"/>
	    </xsl:attribute>
	    
  </xsl:attribute-set>

  <xsl:attribute-set name="region-body__backcover.odd" use-attribute-sets="region-body.odd">
  </xsl:attribute-set>
  <xsl:attribute-set name="region-body__backcover.even" use-attribute-sets="region-body.even">
  </xsl:attribute-set>

  <!-- legacy attribute set -->
  <xsl:attribute-set name="region-body__index" use-attribute-sets="region-body__index.odd"/>

  <xsl:attribute-set name="region-body__index.odd" use-attribute-sets="region-body.odd">
    <xsl:attribute name="column-count">2</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="region-body__index.even" use-attribute-sets="region-body.even">
    <xsl:attribute name="column-count">2</xsl:attribute>
  </xsl:attribute-set>

<!-- #AND special region after for the inserted blank pages. -->
  <xsl:attribute-set name="blank-region-after">
    <xsl:attribute name="extent">170mm</xsl:attribute>
    <xsl:attribute name="display-align">after</xsl:attribute>
  </xsl:attribute-set>

<!-- #AND special region attr set for header for the first page on short template -->
<xsl:attribute-set name="region-before-first">
    <xsl:attribute name="extent">
      40mm
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
  </xsl:attribute-set>


  <xsl:attribute-set name="region-before">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-after">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">after</xsl:attribute>
  </xsl:attribute-set>
    
</xsl:stylesheet>