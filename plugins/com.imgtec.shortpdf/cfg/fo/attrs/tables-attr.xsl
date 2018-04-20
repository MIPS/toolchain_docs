<?xml version="1.0"?>

<!--
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved.
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other
trademarks are the property of their respective owners.

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE &quot;AS IS,&quot; WITH
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
Software or its derivatives. In no event shall Idiom Technologies, Inc.&apos;s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project hosted on Sourceforge.net.
See the accompanying license.txt file for applicable licenses.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">

  <!-- contents of table entries or similer structures 
  #AND 13062017 set to use common.title settings-->
  <xsl:attribute-set name="common.table.body.entry" use-attribute-sets="base-font">
    <xsl:attribute name="space-before">1.5pt</xsl:attribute>
    <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
    <xsl:attribute name="space-after">1.5pt</xsl:attribute>
    <xsl:attribute name="space-after.conditionality">retain</xsl:attribute>
    <xsl:attribute name="start-indent">3pt</xsl:attribute>
    <xsl:attribute name="end-indent">3pt</xsl:attribute>
    
  </xsl:attribute-set>
<!-- #AND added outputclass simple_register to modify table output appearance.
#AND 08062017 amended alignment of simple-register-->
  <xsl:attribute-set name="common.table.head.entry">

    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="color">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/table ')][@outputclass='simple_register']">#0066B5</xsl:when>
		      
			<xsl:otherwise>white</xsl:otherwise>
		</xsl:choose>
	</xsl:attribute>
       
       <xsl:attribute name="font-size">
	       <xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/table ')][@outputclass='simple_register']">6pt</xsl:when>
			<xsl:otherwise>9pt</xsl:otherwise>
		</xsl:choose>
	</xsl:attribute>
	
	<xsl:attribute name="text-align">
	       <xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/table ')][@outputclass='simple_register']">center</xsl:when>
			<xsl:otherwise>left</xsl:otherwise>
		</xsl:choose>
	</xsl:attribute>
    
  </xsl:attribute-set>

  <xsl:attribute-set name="table.title" use-attribute-sets="base-font common.title">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="space-before">10pt</xsl:attribute>
    <xsl:attribute name="space-after">10pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__tableframe__none"/>

<!-- #AND alter to check for simple_register outputclass and change top border to white -->
 <xsl:attribute-set name="__tableframe__top" use-attribute-sets="common.border__top">
	<xsl:attribute name="border-top-color">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/table ')][@outputclass='simple_register']">white</xsl:when>
		<xsl:otherwise>black</xsl:otherwise></xsl:choose>
	</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__tableframe__bottom" use-attribute-sets="common.border__bottom">
    <xsl:attribute name="border-after-width.conditionality">retain</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="thead__tableframe__bottom" use-attribute-sets="common.border__bottom">
  </xsl:attribute-set>

  <xsl:attribute-set name="__tableframe__left" use-attribute-sets="common.border__left">
  </xsl:attribute-set>

  <xsl:attribute-set name="__tableframe__right" use-attribute-sets="common.border__right">
  </xsl:attribute-set>

  <xsl:attribute-set name="table" use-attribute-sets="base-font">
    <!--It is a table container -->
    <xsl:attribute name="space-after">10pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="table.tgroup">
    <!--It is a table-->
    <xsl:attribute name="table-layout">fixed</xsl:attribute>
    <xsl:attribute name="width">100%</xsl:attribute>
    <!--xsl:attribute name=&quot;inline-progression-dimension&quot;&gt;auto&lt;/xsl:attribute-->
    <!--        &lt;xsl:attribute name=&quot;background-color&quot;&gt;white&lt;/xsl:attribute&gt;-->
    <xsl:attribute name="space-before">5pt</xsl:attribute>
    <xsl:attribute name="space-after">5pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__all" use-attribute-sets="table__tableframe__topbot table__tableframe__sides">
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__topbot" use-attribute-sets="table__tableframe__top table__tableframe__bottom">
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__top" use-attribute-sets="common.border__top">
	<xsl:attribute name="border-top-color">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/table ')][@outputclass='simple_register']">white</xsl:when>
		<xsl:otherwise>black</xsl:otherwise></xsl:choose>
	</xsl:attribute>									 
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__bottom" use-attribute-sets="common.border__bottom">
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__sides" use-attribute-sets="table__tableframe__right table__tableframe__left">
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__right" use-attribute-sets="common.border__right">
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__left" use-attribute-sets="common.border__left">
  </xsl:attribute-set>

  <xsl:attribute-set name="tgroup.tbody">
    <!--Table body-->
  </xsl:attribute-set>

  <xsl:attribute-set name="tgroup.thead">
    <!--Table head-->
  </xsl:attribute-set>

  <xsl:attribute-set name="tgroup.tfoot">
    <!--Table footer-->
  </xsl:attribute-set>

<!-- #AND standard attribute set -->
  <xsl:attribute-set name="thead.row">
    <!--Head row-->
 	
  </xsl:attribute-set>

<!-- #AND simple-register attribute set-->
  <xsl:attribute-set name="thead-simple-register.row">
    <!--Head row-->
 	
 			<xsl:attribute name="border-top-color">white</xsl:attribute>
 			<xsl:attribute name="border-top-style">solid</xsl:attribute>
 			<xsl:attribute name="border-top-width">1pt</xsl:attribute>
 			<xsl:attribute name="border-left-color">white</xsl:attribute>
 			<xsl:attribute name="border-left-style">solid</xsl:attribute>
 			<xsl:attribute name="border-left-width">1pt</xsl:attribute>
 			<xsl:attribute name="border-right-color">white</xsl:attribute>
 			<xsl:attribute name="border-right-style">solid</xsl:attribute>
 			<xsl:attribute name="border-right-width">1pt</xsl:attribute>
			<xsl:attribute name="border-after-color">black</xsl:attribute>
			<xsl:attribute name="border-after-style">solid</xsl:attribute>
			<xsl:attribute name="border-after-width">1pt</xsl:attribute>
			<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
			<xsl:attribute name="border-bottom-color">black</xsl:attribute>
			<xsl:attribute name="border-bottom-width">1.25pt</xsl:attribute>
 	
  </xsl:attribute-set>

  <xsl:attribute-set name="tfoot.row">
    <!--Table footer-->
  </xsl:attribute-set>

  <xsl:attribute-set name="tbody.row" use-attribute-sets="common.border">
    <!--Table body row-->
  </xsl:attribute-set>

  <xsl:attribute-set name="thead.row.entry">
    <!-- #AND head cell
    Modified with IMG purple background except for outputclass register_simple which has white background
    -->
    <xsl:attribute name="background-color">
	<xsl:choose>
				<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/table ')][@outputclass='simple_register']">white</xsl:when>
		      
			<xsl:otherwise>#0066B5</xsl:otherwise>
		</xsl:choose>
</xsl:attribute>
     
  </xsl:attribute-set>

  <xsl:attribute-set name="thead.row.entry__content" use-attribute-sets="common.table.body.entry common.table.head.entry ">
    <!--head cell contents-->
	<!--head cell contents
    
	#AND 1606 adding font size control via outputclass
	
	-->
	
	<xsl:attribute name="font-size">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/row ')][@outputclass='fontsize-small']">80%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/row ')][@outputclass='fontsize-tiny']">60%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/row ')][@outputclass='fontsize-large']">120%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/row ')][@outputclass='fontsize-huge']">140%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/row ')][@outputclass='bitnumber']">60%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-small']">80%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-tiny']">60%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-large']">120%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-huge']">140%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='bitnumber']">60%</xsl:when>
			<xsl:otherwise>90%</xsl:otherwise>

		</xsl:choose>
    </xsl:attribute>
	
	
  </xsl:attribute-set>

  <xsl:attribute-set name="tfoot.row.entry">
    <!--footer cell-->
  </xsl:attribute-set>

  <xsl:attribute-set name="tfoot.row.entry__content" use-attribute-sets="common.table.body.entry common.table.head.entry">
    <!--footer cell contents-->
  </xsl:attribute-set>

  <xsl:attribute-set name="tbody.row.entry" use-attribute-sets="common.border__right">
    <!--body cell-->
    <!--body cell #AND 08062017 add options for selecting colour -->
    <xsl:attribute name="background-color">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='goodCell']">#C6EFCE</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='badCell']">#FFC7CE</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='neutralCell']">#FFEB9C</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='resCell']">#E6E6E6</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='subheading']">#B3B3B3</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='notCell']">#FFFFFF</xsl:when>
	      
			<xsl:otherwise>white</xsl:otherwise>
		</xsl:choose>
	</xsl:attribute>
    
  </xsl:attribute-set>

  <xsl:attribute-set name="tbody.row.entry__firstcol" use-attribute-sets="tbody.row.entry">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="tbody.row.entry__content" use-attribute-sets="common.table.body.entry">
    <!--body cell contents
    #AND 08062017 added outputclasses for amending font sizes
    -->
    
    <xsl:attribute name="font-size">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-small']">80%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-tiny']">60%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-large']">120%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='fontsize-huge']">140%</xsl:when>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='bitnumber']">60%</xsl:when>

	      
			<xsl:otherwise>90%</xsl:otherwise>
		</xsl:choose>
    </xsl:attribute>
    
    <xsl:attribute name="color">
	<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='bitnumber']">#0066B5</xsl:when>
			<xsl:otherwise>black</xsl:otherwise>
	
	</xsl:choose>
    
    </xsl:attribute>
	<xsl:attribute name="text-align">
		<xsl:choose>
				<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='bitnumber']">center</xsl:when>
				<xsl:otherwise>left</xsl:otherwise>
		
		</xsl:choose>
	</xsl:attribute>
        <xsl:attribute name="font-weight">
	<xsl:choose>
			<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')][@outputclass='subheading']">bold</xsl:when>
			<xsl:otherwise>normal</xsl:otherwise>
	
	</xsl:choose>
    
    </xsl:attribute>
  </xsl:attribute-set>

 <!-- #AND removed DL entry because I don't want definition lists output as tables -->
 
 
 
 
 

  <xsl:attribute-set name="simpletable" use-attribute-sets="base-font">
    <!--It is a table container -->
    <xsl:attribute name="width">100%</xsl:attribute>
    <xsl:attribute name="space-before">8pt</xsl:attribute>
    <xsl:attribute name="space-after">10pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="simpletable__body">
  </xsl:attribute-set>

  <xsl:attribute-set name="sthead">
  </xsl:attribute-set>

  <xsl:attribute-set name="sthead__row">
  <xsl:attribute name="background-color">#0066B5</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="strow">
  </xsl:attribute-set>

  <xsl:attribute-set name="sthead.stentry">
  </xsl:attribute-set>

  <xsl:attribute-set name="sthead.stentry__content" use-attribute-sets="common.table.body.entry common.table.head.entry">
  </xsl:attribute-set>

  <xsl:attribute-set name="sthead.stentry__keycol-content" use-attribute-sets="common.table.body.entry common.table.head.entry">
    <xsl:attribute name="background-color">#0066B5</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="strow.stentry__content" use-attribute-sets="common.table.body.entry">
  </xsl:attribute-set>

  <xsl:attribute-set name="strow.stentry__keycol-content" use-attribute-sets="common.table.body.entry common.table.head.entry">
    <xsl:attribute name="background-color">#0066B5</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="strow.stentry">
  </xsl:attribute-set>

</xsl:stylesheet>