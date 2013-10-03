<!DOCTYPE html>
<html>
	<head>
		<title>Text pluralizer</title>
	</head>
	<body>

	<!---h1>Text pluralizer</h1--->
		Converts sigular words to plural.<br><br>
		<cfset text = "Jack in the box? home/text. like to eat doughnut. big blue bird build bus, bike, and barn.">
		<cfset pluralizedText = createobject("component","LanguageHandler").pluralize(text)>

		Here is the sigular text string.<br>
		<div><cfoutput>#text#</cfoutput></div><br><br>
		Here is the converted plural text string.<br>
		<div><cfoutput>#pluralizedText#</cfoutput></div>

	</body>
</html>