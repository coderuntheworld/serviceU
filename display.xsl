<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>

<!-- 
* SENG1050 Web Technologies 
* Assignment 2
* Due Date: 25 October 2019
* Extension Date: 1 November 2019
*
* File Name: display.xsl
* Author: Isabella Andrews (C3204936)
* Date Created: 23 August 2019
-->

	<xsl:template match="serviceU">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="style.css"/>
				<title>Service U | Services</title>
				<link rel="shortcut icon" href="images/tree.ico"/>
				<!-- Document-level CSS (if appropriate) -->
				<style>
					#services{
						text-align: center;
						padding: 20px 20px;
					}
					#contactInfo{
						margin-top: 8px;
					}
				</style>
			</head>
			<body>
				<header class="navigation">
					<div id="top"/>
					<!-- Navigation bar (Menu bar) -->
					<nav>
						<a href="placeholder.html">Domestic Cleaning</a> | 
						<a href="placeholder.html">Financial Advice</a> | 
						<a href="placeholder.html">Landscape &amp; Garden Planning</a> | 
						<a href="lifeCoaching.xml">Life Coaching</a> | 
						<a href="physicalTraining.xml">Physical Training</a>
					</nav>
					<!-- Page Heading -->
					<a href="index.html" class="title"><h1><xsl:value-of select="business/service/serviceType"/></h1></a>
				</header>
				<!-- List of businesses sorted alphabetically by business name -->
				<main id="services">
					<xsl:apply-templates select="business">
						<xsl:sort select="businessName"/>
					</xsl:apply-templates>
				</main>
				<!-- Footer -->
				<footer>
					<div id="topLink">
						<a href="#top">Back to top</a>
					</div>
					<hr />
					<nav>
						<a href="index.html">Home</a> |
						<a href="aboutUs.html">About Us</a> |
						<a href="contact.html">Contact</a> |
						<a href="privacyPolicy.html">Privacy Policy</a> |
						<a href="termsAndConditions.html">Terms &amp; Conditions</a> |
						<a href="applicationForm.html">Join Our Team</a>
					</nav>
					<hr />
					<address>
						&#xA9; Isabella Andrews. All Rights Reserved.<br/>
						Student ID: C3204936<br/>
						<a href="mailto:isabella.andrews@newcastle.edu.au" target="_top">Contact Isabella via email</a><br/>
						<a href="https://www.newcastle.edu.au/course/SENG1050" target="_blank">SENG1050</a> - Assignment 2<br/>
					</address>
				</footer>
			</body>
		</html>
	</xsl:template>

	<!-- Business details -->
	<xsl:template match="business">
		<div class="services">
			<!-- Image associated with the business -->
			<img alt="Business Photo">
				<xsl:attribute name="src">
					<xsl:value-of select="businessPhoto/image"/>			
				</xsl:attribute>			
			</img>
			<h2 style="text-align: center;"><xsl:value-of select="businessName"/></h2>
			<p>
				<xsl:value-of select="information/description"/>
			</p>
			<p>
				<!-- In-home Pricing --> 
				<strong><xsl:text>In-home Service Pricing</xsl:text></strong><br />
				<xsl:text>Deposit: </xsl:text>
				<xsl:value-of select="information/inHomeService/deposit"/><br />
				<xsl:text>Minimum Price: </xsl:text>
				<xsl:value-of select="information/inHomeService/minimumPrice"/><br />
				<xsl:text>Hourly Fee: </xsl:text>
				<xsl:value-of select="information/inHomeService/hourlyFee"/><br />
			</p>
			<p>
				<!-- Business Hours -->
				<strong><xsl:text>Hours of Operation</xsl:text></strong><br />
				<xsl:for-each select="information/hoursOfOperation">
					<xsl:value-of select="day"/><br />
					<xsl:value-of select="openTime"/><xsl:text> - </xsl:text>
					<xsl:value-of select="closeTime"/><br />
				</xsl:for-each>
			</p>
			<div>
				<!-- Contact Information -->
				<strong>Contact the team at <xsl:value-of select="businessName"/></strong><br />
				<p>
					<!-- URL of the business -->
					<xsl:text>Website: </xsl:text>
					<a href="{contact/url}"><xsl:value-of select="contact/url"/></a><br />
				</p>
				<p>
					<xsl:text>Email: </xsl:text>
					<xsl:value-of select="contact/email"/><br />
				</p>
				<p>
					<xsl:text>Address: </xsl:text><br />
					<xsl:value-of select="contact/address/streetNum"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="contact/address/streetName"/><br />
					<xsl:value-of select="contact/address/suburb"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="contact/address/state"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="contact/address/postcode"/><br />
					<xsl:text>Phone: </xsl:text>
					<xsl:value-of select="contact/phone"/><br />
				</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
