<?xml version='1.0'?>

<!-- 
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved. 
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other 
trademarks are the property of their respective owners. 

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE "AS IS," WITH 
ABSOLUTELY NO WARRANTIES WHATSOEVER, WHETHER EXPRESS OR IMPLIED,  AND IDIOM
TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE AND WARRANTY OF NON-INFRINGEMENT. IDIOM TECHNOLOGIES, INC. SHALL NOT
BE LIABLE FOR INDIRECT, INCIDENTAL, SPECIAL, COVER, PUNITIVE, EXEMPLARY,
RELIANCE, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF 
ANTICIPATED PROFIT), ARISING FROM ANY CAUSE UNDER OR RELATED TO  OR ARISING 
OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF IDIOM
TECHNOLOGIES, INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. 

Idiom Technologies, Inc. and its licensors shall not be liable for any
damages suffered by any person as a result of using and/or modifying the
Software or its derivatives. In no event shall Idiom Technologies, Inc.'s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project hosted on Sourceforge.net. 
See the accompanying license.txt file for applicable licenses.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <xsl:attribute-set name="__frontmatter">
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>

<!-- #AND logo formatting for front page cover page



-->
	<!-- #AND logo container attributes -->
	<xsl:attribute-set name="__frontmatter__logo__container">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="padding">1pt</xsl:attribute>
		<xsl:attribute name="top">0cm</xsl:attribute>
		<xsl:attribute name="left">11cm</xsl:attribute>
		<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
		<xsl:attribute name="content-height">100%</xsl:attribute>
		<xsl:attribute name="width">5cm</xsl:attribute>
		<xsl:attribute name="scaling">uniform</xsl:attribute>
	</xsl:attribute-set> 
	
	<xsl:attribute-set name="__frontmatter__vennlogo">
		<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
		<xsl:attribute name="width">100%</xsl:attribute>
		<xsl:attribute name="scaling">uniform</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__vennlogo__container">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="padding">1pt</xsl:attribute>
		<xsl:attribute name="top">11.5cm</xsl:attribute>
		<!-- <xsl:attribute name="left">1.5cm</xsl:attribute> -->
		
		<xsl:attribute name="content-height">100%</xsl:attribute>
		<xsl:attribute name="width">100%</xsl:attribute>
		<xsl:attribute name="scaling">uniform</xsl:attribute>
	</xsl:attribute-set> 
	
	
	<!-- #AND title container attributes -->
	<xsl:attribute-set name="__frontmatter__title__container">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="top">5cm</xsl:attribute>
		<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
		<xsl:attribute name="content-height">100%</xsl:attribute>
		
		<xsl:attribute name="scaling">uniform</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- #AND secondary meta container attributes -->
	<xsl:attribute-set name="__frontmatter__meta__container">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="top">9cm</xsl:attribute>
		<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
		<xsl:attribute name="content-height">100%</xsl:attribute>
		<xsl:attribute name="left">10.5cm</xsl:attribute>
		<xsl:attribute name="scaling">uniform</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- #AND legal container attributes -->
	<xsl:attribute-set name="__frontmatter__legal__container">
		<xsl:attribute name="position">absolute</xsl:attribute>
		<xsl:attribute name="top">3cm</xsl:attribute>
		<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
		<xsl:attribute name="content-height">100%</xsl:attribute>
		<!-- <xsl:attribute name="left">4cm</xsl:attribute> -->
		<xsl:attribute name="scaling">uniform</xsl:attribute>
	</xsl:attribute-set>
	
	   <xsl:attribute-set name="__frontmatter__legal">
		<xsl:attribute name="font-size">12pt</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
	    </xsl:attribute-set>


	
	
    <!-- #AND commented out out as although this is recommended, it seems to have no effect. 
    <xsl:attribute-set name="__frontmatter__logo">
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set> -->
    
    <xsl:attribute-set name="__frontmatter__title" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <!-- <xsl:attribute name="space-before.conditionality">retain</xsl:attribute> -->
        <xsl:attribute name="font-size">24pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
	<xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>


    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">18pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
	
	<xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
    
   <xsl:attribute-set name="__frontmatter__meta">
        <xsl:attribute name="font-size">14pt</xsl:attribute>
	<xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">36pt</xsl:attribute>
        <xsl:attribute name="font-size">11pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">normal</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__container">
        <xsl:attribute name="position">absolute</xsl:attribute>
        <xsl:attribute name="top">210mm</xsl:attribute>
        <xsl:attribute name="bottom">20mm</xsl:attribute>
        <xsl:attribute name="right">20mm</xsl:attribute>
        <xsl:attribute name="left">20mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__container_content">
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__mainbooktitle">
        <!--<xsl:attribute name=""></xsl:attribute>-->
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__booklibrary">
        <!--<xsl:attribute name=""></xsl:attribute>-->
    </xsl:attribute-set>

  <xsl:attribute-set name="back-cover">
    <xsl:attribute name="force-page-count">end-on-even</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__back-cover">
    <xsl:attribute name="break-before">even-page</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="bookmap.summary">
    <xsl:attribute name="font-size">9pt</xsl:attribute>
  </xsl:attribute-set>

</xsl:stylesheet>