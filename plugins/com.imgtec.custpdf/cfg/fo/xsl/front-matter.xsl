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
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    exclude-result-prefixes="opentopic"
    version="2.0">

    <xsl:template match="*[contains(@class, ' map/topicmeta ')]">
        <fo:block-container xsl:use-attribute-sets="__frontmatter__owner__container">
            <xsl:apply-templates/>
        </fo:block-container>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/author ')]">
        <fo:block xsl:use-attribute-sets="author" >
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/publisher ')]">
        <fo:block xsl:use-attribute-sets="publisher" >
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/copyright ')]">
        <fo:block xsl:use-attribute-sets="copyright" >
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/copyryear ')]">
        <fo:inline xsl:use-attribute-sets="copyryear" >
            <xsl:value-of select="@year"/><xsl:text> </xsl:text>
        </fo:inline>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/copyrholder ')]">
        <fo:inline xsl:use-attribute-sets="copyrholder" >
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:variable name="map" select="//opentopic:map"/>

    <xsl:template name="createFrontMatter">
      <xsl:if test="$generate-front-cover">
        <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="page-sequence.cover">
            <xsl:call-template name="insertFrontMatterStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
              <fo:block-container xsl:use-attribute-sets="__frontmatter">
                
                <!-- #AND logo container  #AND 12102017 below is original corner logo selection commented out as we no longer going to have a corner logo. -->
               <!-- <fo:block-container xsl:use-attribute-sets="__frontmatter__logo__container">
                  <fo:block>
                    <xsl:variable name="logo-temp" select="$map//*[contains(@class, ' topic/prodname ')][1]"/>
   
		      <xsl:choose>
			<xsl:when test="$logo-temp='PvR'">
			   <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/PowerVR_Full_RGB.png)"/>	  
			</xsl:when>
			<xsl:when test="$logo-temp='MIPS'">
			  <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/MIPS_Full_RGB.png)"/>
			</xsl:when>
			<xsl:otherwise>
			  <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/Imagination_Logo_Primary_RGB.png)"/>
			  
			</xsl:otherwise>
		
		     </xsl:choose>
		  
		    
		     <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/MIPS_master_logo.png)"/>
                  </fo:block> 
                </fo:block-container> -->
                <!-- #AND eo logo container  -->
                
                <!-- #AND set the title -->
                <fo:block-container xsl:use-attribute-sets="__frontmatter__title__container">
                  <fo:block xsl:use-attribute-sets="__frontmatter__title">
                    <!-- #AND Using default stuff and adding logos. Needs second title.-->
                    
                    <xsl:choose>
                      <xsl:when test="$map/*[contains(@class,' topic/title ')][1]">
                        <xsl:apply-templates select="$map/*[contains(@class,' topic/title ')][1]"/>
                      </xsl:when>
                      <xsl:when test="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]">
                        <xsl:apply-templates select="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]"/>
                      </xsl:when>
                      <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
                        <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
                      </xsl:otherwise>
                    </xsl:choose> 
                  </fo:block> 
                  
                  <!-- set the subtitle -->
                  <fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
                    <xsl:choose>
                      <xsl:when test="$map//*[contains(@class,' bookmap/booktitlealt ')][1]">
                        <xsl:apply-templates select="$map//*[contains(@class,' bookmap/booktitlealt ')][1]"/>
                      </xsl:when>
                      <xsl:when test="//*[contains(@class, ' map/map ')]/@booktitlealt">
                        <xsl:value-of select="//*[contains(@class, ' map/map ')]/@booktitlealt"/>
                      </xsl:when>
                      
                    </xsl:choose>
                  </fo:block>
                  
                  
                </fo:block-container>
                <!-- #AND eo title container  -->
               
                <!-- #AND venn container  -->
		<!--#AND 12102017 replaced with central MIPS logo -->
                <fo:block-container xsl:use-attribute-sets="__frontmatter__vennlogo__container">
                  <fo:block use-attribute-sets="__frontmatter__vennlogo">
                    <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/MIPS_master_logo.png)"/>
                  </fo:block>
                  
                </fo:block-container>
                <!-- #AND eo vennlogo container    #AND Pull this from en.xml. variable Copyright IMG-->
                
                <!-- #AND 	meta data revision, date, etc container -->
                <fo:block-container xsl:use-attribute-sets="__frontmatter__meta__container">
                  <fo:block xsl:use-attribute-sets="__frontmatter__meta">
                    
                    <!-- #AND Revision -->
                    <xsl:call-template name="getVariable">
                      <xsl:with-param name="id" select="'frontmatter meta revision'"/>
                    </xsl:call-template>
                    
                    <xsl:choose>
                      <xsl:when test="$map//*[contains(@class, ' topic/vrm ')] [1]">
                        <xsl:value-of>
                          <xsl:apply-templates select="($map//*[contains(@class, ' topic/vrm')]/@version)[1]" />
                        </xsl:value-of>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="getVariable">
                          <xsl:with-param name="id" select="'Revision Number'"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                    
                  </fo:block>
                  <fo:block xsl:use-attribute-sets="__frontmatter__meta">
                    
                    <!-- #AND Adds the current date in brackets 
		    12102017 lose the brackets-->
                    
                    <!-- <xsl:text>(</xsl:text> -->
                    <xsl:value-of select="$currentDate"/>
                    <!--<xsl:text>)</xsl:text> -->
                    
                  </fo:block>
                  <fo:block xsl:use-attribute-sets="__frontmatter__meta">
                    
                    <!-- #AND Confidentiality 	-->
                    
                    <xsl:choose>
                      <xsl:when test="$map//*[contains(@class, ' bookmap/bookrestriction ')] [1]">
                        <xsl:value-of select="$map//*[contains(@class, ' bookmap/bookrestriction ')]/@value [1]"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="getVariable">
                          <xsl:with-param name="id" select="'Company Confidentiality'"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </fo:block>
                </fo:block-container>
                <!-- #AND eo meta container  -->
                 <!-- </fo:block>#ANDdebug this doesn't match up. -->
                <!-- #AND eo front-matter block -->
                
                <!-- <xsl:call-template name="createPreface"/> -->
                
                
                <fo:block break-before="page"> 
                  <!-- #AND start of obverse to front page -->
                  <!-- This page needs to contain standard footer, the conditional legal statement and optionally the Document ID selected from othermeta -->
                  <fo:block-container xsl:use-attribute-sets="__frontmatter__legal__container">
                    <fo:block xsl:use-attribute-sets="__frontmatter__legal">
                      <!-- #AND select legal from en.xml 
						
					Test for existence of restriction in bookmap, if not stated, set to Internal. 
					If it exists, set local variable to that restriction. 
					Then insert confidentiality clause dependent on that.-->
                      <xsl:variable name="Conf-temp" select="$map//*[contains(@class, ' bookmap/bookrestriction ')]/@value [1]"/>
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
                  </fo:block-container>
                  
                </fo:block> <!-- #AND end of obverse to front page -->
              </fo:block-container>
	      
	      <fo:block-container xsl:use-attribute-sets="__meta__data__container"> 
	      <!-- #AND container for all metadata for frontpage - positioned on obverse -->
		      <fo:block xsl:use-attribute-sets="__frontmatter__metadata">
			
			<xsl:value-of select="(//*[contains(@class,' topic/othermeta ') and @name = 'documentID'])[1]/@content"/> 
		      
		      </fo:block>
	      </fo:block-container>
	      
	      
	      
	      
            </fo:flow>
        </fo:page-sequence>
      </xsl:if>
    </xsl:template>
  
      
    
  
  
  <!-- #AND frontmatter meta template -->			
  <xsl:template name="insertFrontMatterMeta">
    
    <fo:static-content flow-name="FrontMatterMeta">
      <fo:block xsl:use-attribute-sets="__frontmatter__meta">
        <xsl:call-template name="getVariable">
          <xsl:with-param name="id" select="'frontmatter meta'"/>
          <xsl:with-param name="params">
            <revnum>
              <xsl:value-of select="$revision"/>
            </revnum>
            
            <confStatus>
              <xsl:value-of select="$Confidentiality"/>
            </confStatus>
          </xsl:with-param>
        </xsl:call-template>
      </fo:block>
    </fo:static-content>
    
  </xsl:template>	
    <xsl:template name="createBackCover">
      <xsl:if test="$generate-back-cover">
        <fo:page-sequence master-reference="back-cover" xsl:use-attribute-sets="back-cover">
          <xsl:call-template name="insertBackCoverStaticContents"/>
          <fo:flow flow-name="xsl-region-body">
            <fo:block-container xsl:use-attribute-sets="__back-cover">
              <xsl:call-template name="createBackCoverContents"/>
            </fo:block-container>
          </fo:flow>
        </fo:page-sequence>
      </xsl:if>
    </xsl:template>

    <xsl:template name="createBackCoverContents">
      <fo:block></fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' bookmap/bookmeta ')]" priority="1">
        <fo:block-container xsl:use-attribute-sets="__frontmatter__owner__container">
            <fo:block >
        <xsl:apply-templates/>
            </fo:block>
        </fo:block-container>
    </xsl:template>

<!-- #AND what is this fetched for? It is in by default - comment this out and see what happens-->
   <xsl:template match="*[contains(@class, ' bookmap/booktitlealt ')]" priority="2">
        <fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
  
    <xsl:template match="*[contains(@class, ' bookmap/booktitle ')]" priority="2">
        <fo:block xsl:use-attribute-sets="__frontmatter__booklibrary">
            <xsl:apply-templates select="*[contains(@class, ' bookmap/booklibrary ')]"/>
        </fo:block>
        <fo:block xsl:use-attribute-sets="__frontmatter__mainbooktitle">
            <xsl:apply-templates select="*[contains(@class,' bookmap/mainbooktitle ')]"/>
        </fo:block>
    </xsl:template>

  <xsl:template match="*[contains(@class, ' xnal-d/namedetails ')]">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xnal-d/addressdetails ')]">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xnal-d/contactnumbers ')]">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/bookowner ')]">
    <fo:block xsl:use-attribute-sets="author">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/summary ')]">
    <fo:block xsl:use-attribute-sets="bookmap.summary">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template> 
    
</xsl:stylesheet>