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

    <xsl:attribute-set name="linklist.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <!--Common
    #AND -->
    <xsl:attribute-set name="li.itemgroup">
        <xsl:attribute name="space-after">13pt</xsl:attribute>
        <xsl:attribute name="space-before">3pt</xsl:attribute>
    </xsl:attribute-set>

   <xsl:attribute-set name="common.li">
        <!-- #AND 130717 common li setting 
	26012027 increased spacing after from 1.5 to 5pt --> 
		<xsl:attribute name="space-after">
			<xsl:choose>
				<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')]">
					0pt
				</xsl:when>
				 <xsl:otherwise>
					5pt
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:attribute name="space-before">
			<xsl:choose>
				<xsl:when test="ancestor-or-self::*[contains(@class, ' topic/entry ')]">
					0pt
				</xsl:when>
				 <xsl:otherwise>
					1.5pt
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		
    </xsl:attribute-set>	
	
    <!--Unordered list-->
    <xsl:attribute-set name="ul" use-attribute-sets="common.block">
        <xsl:attribute name="provisional-distance-between-starts">5mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
<!--        <xsl:attribute name="margin-left">-8pt</xsl:attribute>-->
    </xsl:attribute-set>

    <xsl:attribute-set name="ul.li" use-attribute-sets="common.li">
        <!-- #AND 120717 calls common.li to alter spacing in tables
		 --> 
		
    </xsl:attribute-set>

	
	
    <xsl:attribute-set name="ul.li__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ul.li__label__content">
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ul.li__body">
        <xsl:attribute name="start-indent">body-start()</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ul.li__content">
    </xsl:attribute-set>

    <!--Ordered list-->
    <xsl:attribute-set name="ol" use-attribute-sets="common.block">
        <xsl:attribute name="provisional-distance-between-starts">7mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
<!--    <xsl:attribute name="margin-left">-8pt</xsl:attribute>-->
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li" use-attribute-sets="common.li">
        
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
    </xsl:attribute-set>

	<!--#AND taking out the bold-->
    <xsl:attribute-set name="ol.li__label__content">
        <xsl:attribute name="text-align">start</xsl:attribute>
        <!-- <xsl:attribute name="font-weight">bold</xsl:attribute> -->
	<xsl:attribute name="font-weight">normal</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li__body">
        <xsl:attribute name="start-indent">body-start()</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li__content">
    </xsl:attribute-set>

    <!--Simple list-->
    <xsl:attribute-set name="sl" use-attribute-sets="common.block">
        <xsl:attribute name="provisional-distance-between-starts">5mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sl.sli">
        <xsl:attribute name="space-after">1.5pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sl.sli__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sl.sli__label__content">
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sl.sli__body">
        <xsl:attribute name="start-indent">body-start()</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sl.sli__content">
    </xsl:attribute-set>
    
    <!-- #AND - this is from Eliot Kimber's DITA Community GitHub organization -->
    <!-- Definition list 
    Added indent for DT
    03022017 set dd to use base-font -->
	<xsl:attribute-set name="dlentry.dt__content">
		<xsl:attribute name="start-indent">from-parent(start-indent) + 2.5mm</xsl:attribute>
		<xsl:attribute name="space-before">15pt</xsl:attribute>
		<xsl:attribute name="space-after">5pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-size" select="$default-font-size"/>
		<xsl:attribute name="color">black</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="dlentry.dd__content" use-attribute-sets="base-font">
		<xsl:attribute name="start-indent">from-parent(start-indent) + 5mm</xsl:attribute>
		<!-- #AND - added by me to prevent a definition breaking across a pagebreak 
		Then removed as this was dangerous when other elements were in a definition list. Orphans control is better
		<xsl:attribute name="keep-together.within-page">always</xsl:attribute> -->
		<xsl:attribute name="orphans">2</xsl:attribute>
	</xsl:attribute-set>
	

	
	
</xsl:stylesheet>