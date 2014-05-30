
Looping over a ColdFusion structure to get the name and value without knowing what is in the structure.<br><br>

<cfscript>
	dataStruct = {};
	dataStruct.name = "Santa Clause";
	dataStruct.address = "1111 north pole";
	dataStruct.title = "Santa";
	dataStruct.age = "Unknown";
</cfscript>


<cfoutput>
	<cfloop list="#structKeyList(dataStruct)#" index="x">
		Key: #lcase(x)#, Value: #dataStruct[x]#<br />
	</cfloop>
</cfoutput>
