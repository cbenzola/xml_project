<?xml version="1.0" encoding="utf-8"?>

<!--
   
   Final Project
   
   Filename: woodBats.xsl
   Author: Chris Benzola
   Date:   04/28/2019
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

    <xsl:template match="/">
        <html>

            <head>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
                <link href="../css/finalProject.css" rel="stylesheet" type="text/css" />
                <link href="../css/finalProject_Layout.css" rel="stylesheet" type="text/css" />
                <link href="../css/header.css" rel="stylesheet" type="text/css" />
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
                <script src="../scripts/jquery.js"></script>
                <script src="../scripts/jquery-3.3.1.min.js"></script>
                <script src="scripts/xslt.js"></script>

                <title>Baseball Bats</title>

            </head>
            <nav id="nav"></nav>
            <body>

                <div id="wrapper_home">
                    <div id="content">
                        <div class="pageHeading">
                            <h1>Men's Wood Bats</h1>
                        </div>

                        <div class="subMenu">
                            <ul class="horizontal-list">
                                <li>
                                    <button class="stat-view active">
                                        <a id="baseball_bats" href="../xml/baseballBats.xml">Metal</a>
                                    </button>
                                </li>
                                <li>
                                    <button class="stat-view">

                                        <a id="wood_bats" href="../xml/woodBats.xml">Wood</a>

                                    </button>
                                </li>

                            </ul>
                        </div>

                        <div class="glove-container">
                            <div class="glove-row glove-row-core">


                                <xsl:apply-templates select="woodBats/bat">
                                    <xsl:sort select="price" />
                                </xsl:apply-templates>

                            </div>

                        </div>
                    </div>
                    <footer id="footer">
                        Designed By Chris Benzola
                    </footer>
                </div>

            </body>
            <script src="../scripts/java.js"></script>
        </html>

    </xsl:template>

    <xsl:template match="bat">
        <div class="glove_item">
            <div class="gloveImage">
                <img src="{batImage}" class="gloveImg"/>
            </div>
            <div class="gloveInfo">
                <h3>
                    <xsl:value-of select="batName" />
                </h3>
                <p>
                    <xsl:value-of select="description" />
                </p>
                <xsl:value-of select="batID" />
                <br/>
                <xsl:value-of select="format-number(batPrice, '$###.##')" />
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
