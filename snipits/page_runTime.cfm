<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <title>Determine How Long Your ColdFusion Page Has Been Running</title>
    </head>
    <body>
    	<cfparam name="url.pause" default="5000" />
    	<cfset seconds = url.pause/1000>
    	<cfset sleep(url.pause) />
    	Determine How Long Your ColdFusion Page Has Been Running<br />
		<cfoutput>
			Make page pause for #seconds# seconds.
			<br /><br />

			<!---
				Use the page and fusion context objects to get the
				date/time stamp at which this page started processing.
				Then, get the number of seconds that that start date is
				smaller than the current date/time stamp value.
			--->
			<cfset intRunTimeInSeconds = DateDiff(
				"s",
				GetPageContext().GetFusionContext().GetStartTime(),
				Now()
			) />


			<!---
				Output the number of seconds in which the page has
				been processing.
			--->
			Page has been processing for: #intRunTimeInSeconds# Seconds

		</cfoutput>

		<br /><br />
		<a href="http://www.bennadel.com/blog/659-Determine-How-Long-Your-ColdFusion-Page-Has-Been-Running-Using-GetPageContext-.htm" target="_blank">Source</a>
		<br /><br />

    </body>
</html>
