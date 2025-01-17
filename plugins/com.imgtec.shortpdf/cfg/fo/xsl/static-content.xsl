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

    <xsl:template name="insertBodyStaticContents">
        <xsl:call-template name="insertBodyFirstHeader"/>
	<xsl:call-template name="insertBodyFirstFooter"/>
        <xsl:call-template name="insertBodyFootnoteSeparator"/>
        <xsl:call-template name="insertBodyOddFooter"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertBodyEvenFooter"/>
	  <!-- <xsl:call-template name="insertDisclaimer"/> -->
        </xsl:if>
        <xsl:call-template name="insertBodyOddHeader"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertBodyEvenHeader"/>
        </xsl:if>
        <!--  #AND not using these 
	
        
        <xsl:call-template name="insertBodyLastHeader"/>
        <xsl:call-template name="insertBodyLastFooter"/> -->
    </xsl:template>

    <xsl:template name="insertTocStaticContents">
        <xsl:call-template name="insertTocOddFooter"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertTocEvenFooter"/>
	  <!--<xsl:call-template name="insertDisclaimer"/>-->
        </xsl:if>
        <xsl:call-template name="insertTocOddHeader"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertTocEvenHeader"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="insertIndexStaticContents">
        <xsl:call-template name="insertIndexOddFooter"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertIndexEvenFooter"/>
	  <!--<xsl:call-template name="insertDisclaimer"/>-->
        </xsl:if>
        <xsl:call-template name="insertIndexOddHeader"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertIndexEvenHeader"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="insertPrefaceStaticContents">
        <xsl:call-template name="insertPrefaceFootnoteSeparator"/>
        <xsl:call-template name="insertPrefaceOddFooter"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertPrefaceEvenFooter"/>
	  <!--<xsl:call-template name="insertDisclaimer"/>-->
        </xsl:if>
        <xsl:call-template name="insertPrefaceOddHeader"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertPrefaceEvenHeader"/>
        </xsl:if>
        <xsl:call-template name="insertPrefaceFirstHeader"/>
        <xsl:call-template name="insertPrefaceFirstFooter"/>
    </xsl:template>

    <xsl:template name="insertFrontMatterStaticContents">
        <xsl:call-template name="insertFrontMatterFootnoteSeparator"/>
        <xsl:call-template name="insertFrontMatterOddFooter"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertFrontMatterEvenFooter"/>
        </xsl:if>
        <xsl:call-template name="insertFrontMatterOddHeader"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertFrontMatterEvenHeader"/>
            <!-- #AND call template for footer -->
            <xsl:call-template name="insertFrontMatterFirstFooter"/>
        </xsl:if>
    </xsl:template>
   

	<!-- #AND container template for the disclaimer. 
	<xsl:template name="insertDisclaimer">
		<fo:static-content flow-name="disclaimer-statement">
			<fo:block xsl:use-attribute-sets="__blankpage_disclaimer">
				<xsl:call-template name="getVariable">
					<xsl:with-param name="id" select="'blank disclaimer'"/>
				</xsl:call-template>
			</fo:block>
		</fo:static-content>
	</xsl:template>
	-->
    <!-- #AND add template for footer on cover page -->
	<xsl:template name="insertFrontMatterFirstFooter">
		<fo:static-content flow-name="first-frontmatter-footer">
		<fo:block xsl:use-attribute-sets="__frontmatter__footer">
		 <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface first footer'"/>
		</xsl:call-template>
		
		</fo:block>
		</fo:static-content>
	
	
	</xsl:template>
  
    <xsl:template name="insertBackCoverStaticContents">
      <xsl:call-template name="insertBackCoverOddFooter"/>
      <xsl:if test="$mirror-page-margins">
        <xsl:call-template name="insertBackCoverEvenFooter"/>
      </xsl:if>
      <xsl:call-template name="insertBackCoverOddHeader"/>
      <xsl:if test="$mirror-page-margins">
        <xsl:call-template name="insertBackCoverEvenHeader"/>
      </xsl:if>
    </xsl:template>

    <xsl:template name="insertGlossaryStaticContents">
        <xsl:call-template name="insertGlossaryOddFooter"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertGlossaryEvenFooter"/>
        </xsl:if>
        <xsl:call-template name="insertGlossaryOddHeader"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertGlossaryEvenHeader"/>
        </xsl:if>
    </xsl:template>

    <!-- #AND amendments to body odd -->
    <xsl:template name="insertBodyOddHeader">

        <fo:static-content flow-name="odd-body-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body odd header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
			<revnum>
				<xsl:value-of select="$revision"/>
			</revnum>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
		
            </fo:block>
        </fo:static-content>

    </xsl:template>

 <!-- #AND amendments to body even -->
    <xsl:template name="insertBodyEvenHeader">

        <fo:static-content flow-name="even-body-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body even header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
			<revnum>
				<xsl:value-of select="$revision"/>
			</revnum>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>

    </xsl:template>

    <!-- #AND start version using fo:block 

    
    -->
    
        <xsl:template name="insertBodyFirstHeader">
	    
		<fo:static-content flow-name="first-body-header">
		<fo:block-container xsl:use-attribute-sets="__firstpage__header__container">
		    
		    <xsl:variable name="docID-temp" select="(//*[contains(@class,' topic/othermeta ') and @name = 'documentID'])[1]/@content"/>
		    
		    <fo:table table-layout="fixed" inline-progression-dimension="100%" absolute-position="absolute" top="0" width="75%">
		    
		    <fo:table-body>
			<fo:table-row>
			    <fo:table-cell xsl:use-attribute-sets="short-bookmain">
				<fo:block><xsl:value-of select="$BookMain"/></fo:block> 
			    </fo:table-cell>
			</fo:table-row>
			<fo:table-row>
			    <fo:table-cell xsl:use-attribute-sets="short-booksecondary">
				<fo:block><xsl:value-of select="$BookSecondary"/></fo:block> 
			    </fo:table-cell>
			</fo:table-row>
			<fo:table-row>
			    <fo:table-cell xsl:use-attribute-sets="short-legal">
				<fo:block> 
				    Revision: <xsl:value-of select="$revision"/> 
				</fo:block> 
				<fo:block> 
				    Published: <xsl:value-of select="$currentDate"/> 
				</fo:block>
				<fo:block> 
				    <xsl:value-of select="$Confidentiality"/>
				</fo:block>
				<xsl:if test="$docID-temp !=''">
					<fo:block> 
					    Document ID: <xsl:value-of select="$docID-temp"/>
					</fo:block>
				</xsl:if>
			    </fo:table-cell>
			</fo:table-row>
		    </fo:table-body>
		</fo:table>
		</fo:block-container>
		<fo:block-container  xsl:use-attribute-sets="__shortpdf__logo__container">
                  <fo:block xsl:use-attribute-sets="__shortpdf__logo__block">
                     <xsl:variable name="logo-temp" select="$map//*[contains(@class, ' topic/prodname ')][1]"/>
  
		      <xsl:choose>
			<xsl:when test="$logo-temp='PvR'">
			   <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/PowerVR_small_RGB.png)"/>	  
			</xsl:when>
			<xsl:when test="$logo-temp='MIPS'">
			  <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/MIPS_blue_logo.png)"/>
			</xsl:when>
			<xsl:otherwise>
			  <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/Imagination_Logo_Primary_RGB-small.png)"/>
			  
			</xsl:otherwise>
		
		     </xsl:choose>
                  </fo:block> 
                </fo:block-container>
		</fo:static-content>
	    
    </xsl:template>
    
    
    <!-- #AND end -->
    
    <!-- #AND Vanilla version pulling from en.xml

<xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:block xsl:use-attribute-sets="__body__first__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body first footer'"/>
                    <xsl:with-param name="params">
			<revnum>
                          <xsl:value-of select="$revision"/>
                        </revnum>
			<confStatus>
                          <xsl:value-of select="$Confidentiality"/>
                        </confStatus>
			<currentDate>
                          <xsl:value-of select="$currentDate"/>
                        </currentDate>
                        
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template> -->
    
    
    
    <!-- #AND start version using fo:block 

    
    -->
    
        <xsl:template name="insertBodyFirstFooter">
	    
		<fo:static-content flow-name="first-body-footer">
		<fo:block-container xsl:use-attribute-sets="__firstpage__footer__container">
		    <fo:table table-layout="fixed" inline-progression-dimension="100%" absolute-position="absolute" top="0" bottom="0">
		    <fo:table-column column-number="1" column-width="100%"/>
		    
		    <fo:table-body>
			<fo:table-row>
			    <fo:table-cell>
				<fo:block xsl:use-attribute-sets="__firstpage__footer__confidentiality">
				<!-- #AND select legal from en.xml 
						
					Test for existence of restriction in bookmap, if not stated, set to Internal. 
					If it exists, set local variable to that restriction. 
					Then insert confidentiality clause dependent on that.-->
				      <xsl:variable name="Conf-temp">
					<xsl:value-of select="$map//*[contains(@class, ' bookmap/bookrestriction ')]/@value [1]"/>
				      </xsl:variable>
				      <xsl:choose>
					<xsl:when test="$Conf-temp='Strictly Confidential'">
					  
					  <xsl:call-template name="getVariable">
					    <xsl:with-param name="id" select="'Strictly Confidential Legal Clause'"/>
					  </xsl:call-template>
					</xsl:when>
					<xsl:when test="$Conf-temp='Confidential'">
					  
					  <xsl:call-template name="getVariable">
					    <xsl:with-param name="id" select="'Confidential Legal Clause'"/>
					  </xsl:call-template>
					</xsl:when>
					<xsl:when test="$Conf-temp='Public'">
					  
					  <xsl:call-template name="getVariable">
					    <xsl:with-param name="id" select="'Public Legal Clause'"/>
					  </xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
					  <xsl:call-template name="getVariable">
					    <xsl:with-param name="id" select="'InternalLegalClause'"/>
					  </xsl:call-template>
					</xsl:otherwise>
					
				      </xsl:choose>
				</fo:block>
			    </fo:table-cell>
			    
		       </fo:table-row>
		    </fo:table-body>
		</fo:table>
		</fo:block-container>
		</fo:static-content>
	    
    </xsl:template>
    
    
    <!-- #AND end -->

    
<!-- #AND commented out first, last footer footers are the same
    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:block xsl:use-attribute-sets="__body__first__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body first footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <fo:block xsl:use-attribute-sets="__body__last__header">
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <fo:block xsl:use-attribute-sets="__body__last__footer">
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFootnoteSeparator">
        <fo:static-content flow-name="xsl-footnote-separator">
            <fo:block>
                <fo:leader xsl:use-attribute-sets="__body__footnote__separator"/>
            </fo:block>
        </fo:static-content>
    </xsl:template> -->




<!-- #AND modified body odd footer -->
    <xsl:template name="insertBodyOddFooter">

        <fo:static-content flow-name="odd-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body odd footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
			<compName>
                            <xsl:value-of select="$CompanyName"/>
			    <fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
                        </compName>
			<confStatus>
				<xsl:value-of select="$Confidentiality"/>
				<fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
			</confStatus>
			<!-- Need confidentiality and companyname - which comes from organization-->
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>

    </xsl:template>

<!-- #AND modified body even footer -->
    <xsl:template name="insertBodyEvenFooter">

        <fo:static-content flow-name="even-body-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body even footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
			<compName>
                            <fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
			    <xsl:value-of select="$CompanyName"/>
			</compName>
			<confStatus>
				<fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
				<xsl:value-of select="$Confidentiality"/>
			</confStatus>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>

    </xsl:template>

<!-- #AND modified ToC odd header -->
    <xsl:template name="insertTocOddHeader">
        <fo:static-content flow-name="odd-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__odd__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Toc odd header'"/>
                    <!-- #AND adding parameters -->
		    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
			<revnum>
				<xsl:value-of select="$revision"/>
			</revnum>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
		    
                </xsl:call-template>
		
            </fo:block>
        </fo:static-content>

    </xsl:template>

<!-- #AND modified ToC even header -->
    <xsl:template name="insertTocEvenHeader">
        <fo:static-content flow-name="even-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__even__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Toc even header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
			<revnum>
				<xsl:value-of select="$revision"/>
			</revnum>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>

    </xsl:template>

<!-- #AND modified ToC odd footer -->
   <xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer">
            <fo:block xsl:use-attribute-sets="__toc__odd__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Toc odd footer'"/>
                    <xsl:with-param name="params">
                       <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
			<compName>
                            <xsl:value-of select="$CompanyName"/>
			    <fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
			    
			</compName>
			<confStatus>
				<xsl:value-of select="$Confidentiality"/>
				<fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
			</confStatus>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>

    </xsl:template>

<!-- #AND modified ToC even footer -->
    <xsl:template name="insertTocEvenFooter">
        <fo:static-content flow-name="even-toc-footer">
            <fo:block xsl:use-attribute-sets="__toc__even__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Toc even footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
			<compName>
                            <fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
			    <xsl:value-of select="$CompanyName"/>
			</compName>
			<confStatus>
				<fo:leader xsl:use-attribute-sets="__hdrftr__leader"/>
				<xsl:value-of select="$Confidentiality"/>
			</confStatus>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>

    </xsl:template>

    <xsl:template name="insertIndexOddHeader">
        <fo:static-content flow-name="odd-index-header">
            <fo:block xsl:use-attribute-sets="__index__odd__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Index odd header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__index__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexEvenHeader">
        <fo:static-content flow-name="even-index-header">
            <fo:block xsl:use-attribute-sets="__index__even__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Index even header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__index__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="odd-index-footer">
            <fo:block xsl:use-attribute-sets="__index__odd__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Index odd footer'"/>
                    <xsl:with-param name="params">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__index__odd__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexEvenFooter">
        <fo:static-content flow-name="even-index-footer">
            <fo:block xsl:use-attribute-sets="__index__even__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Index even footer'"/>
                    <xsl:with-param name="params">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__index__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface odd header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface even header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <fo:block xsl:use-attribute-sets="__body__first__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface first header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                          <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__first__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:block xsl:use-attribute-sets="__body__first__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface first footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceLastHeader">
        <fo:static-content flow-name="last-body-header">
            <fo:block xsl:use-attribute-sets="__body__last__header">
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <fo:block xsl:use-attribute-sets="__body__last__footer">
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceFootnoteSeparator">
        <fo:static-content flow-name="xsl-footnote-separator">
            <fo:block>
                <fo:leader xsl:use-attribute-sets="__body__footnote__separator"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface odd footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface even footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterOddHeader">
        <fo:static-content flow-name="odd-frontmatter-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface odd header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterEvenHeader">
        <fo:static-content flow-name="even-frontmatter-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface even header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterLastHeader">
        <fo:static-content flow-name="last-frontmatter-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface even header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterLastFooter">
        <fo:static-content flow-name="last-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__last__footer">
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterFootnoteSeparator">
        <fo:static-content flow-name="xsl-footnote-separator">
            <fo:block>
                <fo:leader xsl:use-attribute-sets="__body__footnote__separator"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterOddFooter">
        <fo:static-content flow-name="odd-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface odd footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterEvenFooter">
        <fo:static-content flow-name="even-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Preface even footer'"/>
                    <xsl:with-param name="params">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
  
    <xsl:template name="insertBackCoverOddHeader">
      <fo:static-content flow-name="odd-back-cover-header">
        <fo:block xsl:use-attribute-sets="__body__odd__header">
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'Preface odd header'"/>
            <xsl:with-param name="params">
              <prodname>
                <xsl:value-of select="$productName"/>
              </prodname>
              <heading>
                <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                  <fo:retrieve-marker retrieve-class-name="current-header"/>
                </fo:inline>
              </heading>
              <pagenum>
                <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                  <fo:page-number/>
                </fo:inline>
              </pagenum>
            </xsl:with-param>
          </xsl:call-template>
        </fo:block>
      </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertBackCoverEvenHeader">
      <fo:static-content flow-name="even-back-cover-header">
        <fo:block xsl:use-attribute-sets="__body__even__header">
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'Preface even header'"/>
            <xsl:with-param name="params">
              <prodname>
                <xsl:value-of select="$productName"/>
              </prodname>
              <heading>
                <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                  <fo:retrieve-marker retrieve-class-name="current-header"/>
                </fo:inline>
              </heading>
              <pagenum>
                <fo:inline xsl:use-attribute-sets="__body__even__header__pagenum">
                  <fo:page-number/>
                </fo:inline>
              </pagenum>
            </xsl:with-param>
          </xsl:call-template>
        </fo:block>
      </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertBackCoverOddFooter">
      <fo:static-content flow-name="odd-back-cover-footer">
        <fo:block xsl:use-attribute-sets="__body__odd__footer">
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'Preface odd footer'"/>
            <xsl:with-param name="params">
              <heading>
                <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
                  <fo:retrieve-marker retrieve-class-name="current-header"/>
                </fo:inline>
              </heading>
              <pagenum>
                <fo:inline xsl:use-attribute-sets="__body__odd__footer__pagenum">
                  <fo:page-number/>
                </fo:inline>
              </pagenum>
            </xsl:with-param>
          </xsl:call-template>
        </fo:block>
      </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertBackCoverEvenFooter">
      <fo:static-content flow-name="even-back-cover-footer">
        <fo:block xsl:use-attribute-sets="__body__even__footer">
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'Preface even footer'"/>
            <xsl:with-param name="params">
              <heading>
                <fo:inline xsl:use-attribute-sets="__body__even__footer__heading">
                  <fo:retrieve-marker retrieve-class-name="current-header"/>
                </fo:inline>
              </heading>
              <pagenum>
                <fo:inline xsl:use-attribute-sets="__body__even__footer__pagenum">
                  <fo:page-number/>
                </fo:inline>
              </pagenum>
            </xsl:with-param>
          </xsl:call-template>
        </fo:block>
      </fo:static-content>
    </xsl:template>

    <xsl:template name="insertGlossaryOddHeader">
        <fo:static-content flow-name="odd-glossary-header">
            <fo:block xsl:use-attribute-sets="__glossary__odd__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Glossary odd header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__glossary__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertGlossaryEvenHeader">
        <fo:static-content flow-name="even-glossary-header">
            <fo:block xsl:use-attribute-sets="__glossary__even__header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Glossary even header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__even__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__glossary__even__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertGlossaryOddFooter">
        <fo:static-content flow-name="odd-glossary-footer">
            <fo:block xsl:use-attribute-sets="__glossary__odd__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Glossary odd footer'"/>
                    <xsl:with-param name="params">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__glossary__odd__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertGlossaryEvenFooter">
        <fo:static-content flow-name="even-glossary-footer">
            <fo:block xsl:use-attribute-sets="__glossary__even__footer">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Glossary even footer'"/>
                    <xsl:with-param name="params">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__glossary__even__footer__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

</xsl:stylesheet>