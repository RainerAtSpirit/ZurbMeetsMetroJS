<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsl ddwrt2 ddwrt msxsl"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ddwrt2="urn:frontpage:internal"
                xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
        >
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="CreateLabel"></xsl:param>
    <xsl:variable name="Rows"
                  select="/dsQueryResponse/Rows/Row[not(@__spHidden = 'True') and not(contains(@__spDefaultViewUrl, '_catalogs')) and @__spTitle != 'ServiceFiles']"/>
    <!-- Could use and __spOnQuickLaunch="True" -->
    <xsl:variable name="RowCount" select="count($Rows)"/>
    <xsl:variable name="IsEmpty" select="$RowCount = 0"/>

    <xsl:variable name="colorMap">
        <item BaseTemplate="Contacts" color="lime" />
        <item BaseTemplate="DocumentLibrary" color="teal" />
        <item BaseTemplate="GenericList" color="green" />
        <item BaseTemplate="Tasks" color="red" />
    </xsl:variable>

    <xsl:template match="/">
		<xsl:variable name="listCount">
			<xsl:for-each select="$Rows">
			<xsl:sort select="@__spItemCount" order="descending" data-type="number" />
				<item id="{@__spID}" count="{@__spItemCount}" pos="{position()}" />
			</xsl:for-each>
		</xsl:variable>

        <xsl:for-each select="$Rows">
            <xsl:sort
                    select="translate(substring-before(substring-after(@__spPropertiesXml, 'Modified=&quot;'), '&quot; LastDeleted'), ' :', '')"
                    order="descending" data-type="number"/>
            <!--<xsl:sort select="@__spItemCount" order="descending" data-type="number" />-->
            <xsl:variable name="DateRaw"
                          select="translate(substring-before(substring-after(@__spPropertiesXml, 'Modified=&quot;'), '&quot; LastDeleted'), ' ', 'T')"/>
            <xsl:variable name="PrettyDateUTC"
                          select="concat(substring($DateRaw, 1, 4), '-', substring($DateRaw, 5, 2), '-', substring($DateRaw, 7,2), substring($DateRaw, 9), 'Z')"/>

			<xsl:variable name="baseTemplate" select="@__spBaseTemplate" />
			<xsl:variable name="spID" select="@__spID" />
            <xsl:variable name="color">
				<xsl:choose>
					<xsl:when test="msxsl:node-set($colorMap)/item[@BaseTemplate = $baseTemplate]">
						<xsl:value-of select="msxsl:node-set($colorMap)/item[@BaseTemplate = $baseTemplate]/@color"  />
					</xsl:when>
					<xsl:otherwise>blue</xsl:otherwise>
				</xsl:choose>
            </xsl:variable>
            <xsl:variable name="size">
				<xsl:choose>
					<xsl:when test="msxsl:node-set($listCount)/item[@id = $spID]/@pos &lt; 4">
						<xsl:text>wide</xsl:text>
					</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
            </xsl:variable>

            <xsl:if test="position() &lt; 13">
                <div id="{concat('tile-', position())}" class="live-tile {$color} {$size}" data-stops="100%" data-speed="750"
                     data-delay="5000" >
                    <span class="tile-title">
                        <xsl:value-of select="@__spTitle"/>
                        <span class="success round label"> <xsl:value-of select="@__spItemCount"/></span>
                    </span>
                    <div>
                        <img src="{@__spImageUrl}" class="micon"/>
                    </div>
                    <div>
                        <h5 class="subheader"><xsl:value-of select="@__spTitle"/></h5>
                        <span class="prettyDate" title="{$PrettyDateUTC}"><xsl:value-of select="$PrettyDateUTC"/></span>
                    </div>
                </div>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>