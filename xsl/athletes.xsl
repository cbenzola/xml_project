<?xml version="1.0" encoding="utf-8"?>

<!--
   
   Final Project
   
   Filename: athletes.xsl
   Author: Chris Benzola
   Date:   04/28/2019
-->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                >

    <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

    <xsl:template match="/"> <!-- root element -->
        <html>

            <head>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
                <link href="../css/finalProject.css" rel="stylesheet" type="text/css" />
                <link href="../css/finalProject_Layout.css" rel="stylesheet" type="text/css" />
                <link href="../css/header.css" rel="stylesheet" type="text/css" />
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
                <script src="../scripts/jquery.js"></script>
                <script src="../scripts/jquery-3.3.1.min.js"></script> <!-- inclusion of stylesheets and scripts -->


                <title>Our Athletes</title>

            </head>
            <nav id="nav"></nav>
            <body>

                <div id="wrapper_home">
                    <div id="content">
                        <div class="pageHeading">
                            <h1>Sponsored Athletes</h1>
							
                        </div>

                        <!-- Container and row for the athletes -->

                        <div class="athlete-container">
                            <div class="glove-row glove-row-core">
								
								
								
									<!-- application of athlete template -->
									
                                <xsl:apply-templates select="athletes/athlete"> 
                                    <xsl:sort select="name" />
                                    
                                </xsl:apply-templates>

                                <div class="stats">
                                	<!-- application of stats template -->
									<xsl:apply-templates select="athletes/athlete/stats">
                                    <xsl:sort select="year" />
                                </xsl:apply-templates>
                                    </div>
							

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

		<!-- Table and layout for the athletes -->
    <xsl:template match="athlete">
		
		<!-- Variables and Calculations for Player Batting Average -->
		<xsl:variable name="playerAtBats" select="atBats" />
		<xsl:variable name="playerHits" select="hits" />
		<xsl:variable name="battingAVG" select="$playerHits div $playerAtBats" />
		
        <div class="glove_item">
            <div class="gloveImage">
                <img src="{image}" class="playerImg"/>
            </div>
            <div class="gloveInfo">
                <h3>
                    <xsl:value-of select="name" />
                </h3>
                
                    <xsl:value-of select="team" />
				
				<!-- Beginning of Stats Table -->
                 <table class="stats">
                <tr>
                    <th>Year</th>
                    <th>H</th>
                    <th>HR</th>
                    <th>AVG</th>
                    <th>OBP</th>
                    <th>WAR</th>
					
                </tr>
                
                    <tr>
                        <td>
                            <xsl:value-of select="year" />
                        </td>
                        <td>
                            <xsl:value-of select="hits" />
                        </td>
                        <td>
                            <xsl:value-of select="homeruns" />
                        </td>
                        <td>
							<!-- Implementation of Batting AVG -->
                            <xsl:value-of select="format-number($battingAVG, '.000')" />
                        </td>
                        <td>
                            <xsl:value-of select="onbase" />
                        </td>
                        <td>
                            <xsl:value-of select="war" />
                        </td>
						 <td>
                            
                        </td>
                    </tr>
                
            </table>
        <!-- End Of Table -->
                
        </div>
        </div>
                 </xsl:template>

    <xsl:template match="stats">
        
           
    </xsl:template>
              <!--  <br/>
                <xsl:value-of select="format-number(batPrice, '$###.##')" />
            -->
   
</xsl:stylesheet>
