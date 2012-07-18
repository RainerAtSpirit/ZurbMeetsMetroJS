<xsl:stylesheet version="1.0" 
exclude-result-prefixes="xsl ddwrt2 ddwrt"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:ddwrt2="urn:frontpage:internal"
xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" 
>
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
  	<xsl:param name="CreateLabel"></xsl:param>
  	<xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row[not(@__spHidden = 'True') and not(contains(@__spDefaultViewUrl, '_catalogs')) and @__spTitle != 'ServiceFiles']" />
  <!-- Could use and __spOnQuickLaunch="True" -->
  	<xsl:variable name="RowCount" select="count($Rows)" />
  	<xsl:variable name="IsEmpty" select="$RowCount = 0" />

  	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$IsEmpty">
		</xsl:when>
			<xsl:otherwise>

<style type="text/css"></style> <div id="place" style="left: 0px; top: 0px">
			<div id="wrapper1">

				<xsl:for-each select="$Rows">
                    <xsl:sort select="translate(substring-before(substring-after(@__spPropertiesXml, 'Modified=&quot;'), '&quot; LastDeleted'), ' :', '')" order="descending" data-type="number" />
                    <!--<xsl:sort select="@__spItemCount" order="descending" data-type="number" />-->
                    <xsl:variable name="DateRaw" select="translate(substring-before(substring-after(@__spPropertiesXml, 'Modified=&quot;'), '&quot; LastDeleted'), ' ', 'T')" />
                    <xsl:variable name="PrettyDateUTC" select="concat(substring($DateRaw, 1, 4), '-', substring($DateRaw, 5, 2), '-', substring($DateRaw, 7,2), substring($DateRaw, 9), 'Z')" />


                	<xsl:if test="position() &lt; 13">
				<!-- order by __spLastItemModifiedDate 3/6/2012 10:20:07 AM __spItemCount __spDefaultViewUrl __spTitle __spImageUrl __spSchemaXml -->

					<div id="{concat('tile-', position())}" >
					   <img src="{@__spImageUrl}" class="micon" />
					   <a href="#gridWrapper" class="anchorLink">
					   	<xsl:attribute name="title">
					   		<xsl:choose>
					   			<xsl:when test="@__spDescription and string-length(@__spDescription) &gt; 0"><xsl:value-of select="@__spDescription" /></xsl:when>
					   			<xsl:otherwise><xsl:value-of select="@__spTitle" /></xsl:otherwise>
					   		</xsl:choose>
					   </xsl:attribute>
                       <div class="subtitle"><span class="prettyDate" title="{$PrettyDateUTC}">...</span></div>
					   <div class="title"  data-BaseType="{@__spBaseType}" data-BaseTemplate="{@__spBaseTemplate}"><xsl:value-of select="@__spTitle" /></div>
					   <div class="listcnt"><xsl:value-of select="@__spItemCount" /></div>
					   </a>
					</div>
					
						<xsl:if test="position() = last() and not(position() = 12)" >
		                	<xsl:call-template name="filler">
		                    	<xsl:with-param name="from" select="position() + 1" />
		                    	<xsl:with-param name="until" select="13"/>
		                	</xsl:call-template>
					</xsl:if>
                </xsl:if>
			</xsl:for-each>
  			</div>
		</div>							
		</xsl:otherwise>
		</xsl:choose>
  </xsl:template>
  	<xsl:template name="filler">
        <xsl:param name="from"/>
        <xsl:param name="until"/>
        <xsl:choose>
            <xsl:when test="$from &lt; $until">
				<div id="{concat('tile-', $from)}" style="background-color:#ddd"><img src="/_layouts/images/createcontent.gif" class="micon" /><a href="/_layouts/create.aspx" title="{$CreateLabel}"><div class="title"><xsl:value-of select="$CreateLabel" /></div></a></div>
                <xsl:call-template name="filler">
                    <xsl:with-param name="from" select="$from + 1" />
                    <xsl:with-param name="until" select="$until"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>