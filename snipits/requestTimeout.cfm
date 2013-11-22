<!--- Override default to 5 Minutes --->
<cfparam name="URL.RequestTimeout" default="300" />

<!--- override the server default with the url value --->
<cfsetting RequestTimeout = "#URL.RequestTimeout#" />

<!--- Get the RequestMonitor --->
<cfset GetRequestMonitor = createObject("java", "coldfusion.runtime.RequestMonitor") />

<cfoutput>
	Get the RequestTimeout value.<br />
	This is testing in ColdFusion 8<br /><br />
	Add url.RequestTimeout to change the value<br /><br />
	RequestTimeout: #GetRequestMonitor.getRequestTimeout()# seconds<br /><br />

	<a href="http://www.barneyb.com/barneyblog/2007/08/17/requestmonitorgetrequesttimeout" target="_blank">Source</a>
</cfoutput>
