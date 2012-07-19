<!doctype html>
<%@ Page language="C#" inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint"
        Namespace="Microsoft.SharePoint.WebControls"
        Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register tagprefix="WebPartPages" namespace="Microsoft.SharePoint.WebPartPages" assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

        <!DOCTYPE html>

        <!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
        <!--[if lt IE 7]>
        <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
        <!--[if IE 7]>
        <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
        <!--[if IE 8]>
        <html class="no-js lt-ie9" lang="en"> <![endif]-->
        <!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8"/>

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width"/>

    <title>Welcome to Foundation</title>

    <!-- Included CSS Files -->
    <link rel="stylesheet" href="stylesheets/foundation-style/globals.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/typography.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/grid.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/ui.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/buttons.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/tabs.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/navbar.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/forms.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/orbit.css" />
    <link rel="stylesheet" href="stylesheets/foundation-style/reveal.css"/>
    <link rel="stylesheet" type="text/css" href="stylesheets/MetroJs.lt.css"/>
    <link rel="stylesheet" href="stylesheets/app.css"/>

    <script src="javascripts/foundation/modernizr.foundation.js"></script>

    <!-- IE Fix for HTML5 Tags -->
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>

<div class="row">
    <div class="twelve columns">
        <h1>Welcome to Foundation</h1>

        <p>This is version 3.0 released on June 29, 2012</p>
        <hr/>
    </div>
    <div class="twelve columns tiles">
        <!-- DVWP with DataSourceMode="ListOfLists" -->
        <WebPartPages:DataFormWebPart runat="server" AsyncRefresh="False" FrameType="None" SuppressWebPartChrome="True">
            <ParameterBindings>
                <ParameterBinding Name="CreateLabel" Location="Resource(core,nav_Create)" DefaultValue="Create"/>
            </ParameterBindings>
            <DataFields></DataFields>
            <XslLink>XSLT/ListsAsTiles.xslt</XslLink>
            <Xsl></Xsl>
            <DataSources>
                <SharePoint:SPDataSource runat="server" DataSourceMode="ListOfLists" SelectCommand=""
                                         ID="dsLists"></SharePoint:SPDataSource>
            </DataSources>
        </WebPartPages:DataFormWebPart>
        <!-- DVWP with DataSourceMode="ListOfLists" -->
    </div>
</div>




<!-- Server site creation of list navigation via DataFormWebPart. End -->
<div class="row">
    <div class="eight columns">
        <h3>The Grid</h3>

        <!-- Grid Example -->
        <div class="row">
            <div class="twelve columns">
                <div class="panel">
                    <p>This is a twelve column section in a row. Each of these includes a div.panel element so you can
                        see where the columns are - it's not required at all for the grid.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="six columns">
                <div class="panel">
                    <p>Six columns</p>
                </div>
            </div>
            <div class="six columns">
                <div class="panel">
                    <p>Six columns</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="four columns">
                <div class="panel">
                    <p>Four columns</p>
                </div>
            </div>
            <div class="four columns">
                <div class="panel">
                    <p>Four columns</p>
                </div>
            </div>
            <div class="four columns">
                <div class="panel">
                    <p>Four columns</p>
                </div>
            </div>
        </div>

        <h3>Tabs</h3>
        <dl class="tabs">
            <dd class="active"><a href="#simple1">Simple Tab 1</a></dd>
            <dd><a href="#simple2">Simple Tab 2</a></dd>
            <dd><a href="#simple3">Simple Tab 3</a></dd>
        </dl>

        <ul class="tabs-content">
            <li class="active" id="simple1Tab">This is simple tab 1's content. Pretty neat, huh?</li>
            <li id="simple2Tab">This is simple tab 2's content. Now you see it!</li>
            <li id="simple3Tab">This is simple tab 3's content. It's, you know...okay.</li>
        </ul>

        <h3>Buttons</h3>

        <div class="row">
            <div class="six columns">
                <p><a href="#" class="small button">Small Button</a></p>

                <p><a href="#" class="button">Medium Button</a></p>

                <p><a href="#" class="large button">Large Button</a></p>
            </div>
            <div class="six columns">
                <p><a href="#" class="small alert button">Small Alert Button</a></p>

                <p><a href="#" class="success button">Medium Success Button</a></p>

                <p><a href="#" class="large secondary button">Large Secondary Button</a></p>
            </div>
        </div>
    </div>

    <div class="four columns">
        <h4>Getting Started</h4>

        <p>We're stoked you want to try Foundation! To get going, this file (index.html) includes some basic styles you
            can modify, play around with, or totally destroy to get going.</p>

        <h4>Other Resources</h4>

        <p>Once you've exhausted the fun in this document, you should check out:</p>
        <ul class="disc">
            <li><a href="http://foundation.zurb.com/docs">Foundation Documentation</a><br/>Everything you need to know
                about using the framework.
            </li>
            <li><a href="http://github.com/zurb/foundation">Foundation on Github</a><br/>Latest code, issue reports,
                feature requests and more.
            </li>
            <li><a href="http://twitter.com/foundationzurb">@foundationzurb</a><br/>Ping us on Twitter if you have
                questions. If you build something with this we'd love to see it (and send you a totally boss sticker).
            </li>
        </ul>
    </div>
</div>



<!-- Included JS Files -->
<script src="javascripts/jquery.min.js"></script>
<script src="javascripts/foundation/jquery.reveal.js"></script>
<script src="javascripts/foundation/jquery.orbit-1.4.0.js"></script>
<script src="javascripts/foundation/jquery.customforms.js"></script>
<script src="javascripts/foundation/jquery.placeholder.min.js"></script>
<script src="javascripts/foundation/jquery.tooltips.js"></script>
<script src="javascripts/app.js"></script>
<script type="text/javascript" src="javascripts/MetroJs.lt.js"></script>
<script type="text/javascript" src="javascripts/jquery.prettyDate.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var doBind = (typeof (window.bindAppBarKeyboard) == "undefined" || window.bindAppBarKeyboard);

        // apply regular slide universally unless .exclude class is applied
        // NOTE: The default options for each liveTile are being pulled from the 'data-' attributes
        $(".live-tile, .flip-list").not(".exclude").liveTile();

        //remove default theme and apply applicationBarTheme
        $("body, .tiles").removeClass("dark").removeClass("blue");
        $(".appbar").applicationBar({
            preloadAltBaseTheme : true,
            bindKeyboard : true,
            metroLightUrl : 'images/metroIcons_light.jpg',
            metroDarkUrl : 'images/metroIcons.jpg'
        });
        //enable relative Dates
        $('span.prettyDate').prettyDate();
    });
</script>
<SharePoint:FormDigest ID="FormDigest1" runat="server"></SharePoint:FormDigest>
</body>
</html>
