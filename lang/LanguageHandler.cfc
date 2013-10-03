<cfcomponent output="false">
<!--- converts singular nouns into plural nouns  --->


	<cffunction name="pluralize" access="public" returntype="string" output="false">
		<cfargument name="inputString" type="string" required="true">

		<cfset var delims = "[ .,?!]+">
		<cfset var javaArray = "" />
		<cfset var returnString = "">
		<cfset var esDelim = "x,z,s,ss,ch,sh">
		<cfset var vowels = "a,e,i,o,u">

		<cfset specialReplace = specialCases(inputString)>
		<cfif len(trim(specialReplace)) gt 0>
			<cfreturn specialReplace />
		</cfif>

		<cfif FindNoCase("/", arguments.inputString) >
			<cfset arguments.inputString = replace(arguments.inputString,"/","/ ") />
		</cfif>

		<!---
			Replace specail character with a like ascii version.
			The # is removed due to issues with coldfusion.
			If this is not done the delims will remove this characters when using the split
			function so they will get removed all together.
		--->

		<cfloop list="#delims#" index="i">
			<cfset arguments.inputString = replace(arguments.inputString, i, " #HTMLCodeFormat(i)#", "all") />
		</cfloop>



		<!---cfset arguments.inputString = replace(arguments.inputString, "?", " &##63","all")>
		<cfset arguments.inputString = replace(arguments.inputString, ".", " &##46","all")>
		<cfset arguments.inputString = replace(arguments.inputString, ",", " &##44","all")>
		<cfset arguments.inputString = replace(arguments.inputString, "!", " &##33","all")>
		<cfset arguments.inputString = replace(arguments.inputString, "/", " &##47","all")--->


		<cfset javaArray = arguments.inputString.Split(delims) />

		<cfdump var="#javaArray#" expand="false">

		<cfloop from="1" to="#arraylen(javaArray)#" index="loopWord">
			<cfset thisWord = trim(javaArray[loopWord])>
			<!---
				Need to acount for a / at the end of a word
				Remove the / and add it back in at the end.
			--->
			<cfif right(thisWord,1) eq "/">
				<cfset thisWord = left(thisWord,len(thisWord) - 1)>
				<cfset addFarwardSlashToEnd = true>
			<cfelse>
				<cfset addFarwardSlashToEnd = false>
			</cfif>

			<!--- Loop for additional conditions full word replacements --->
			<cfset returnString = "#returnString#" />

				<!---
					If the word ends in 'ss', 'ch', 'sh' you add an 'es'.
				--->
				<cfif listfindnocase(esDelim,right(thisWord,2))>
					<cfset returnString = "#returnString# #thisWord#es">
				<!---
					If the word ends in 'x', 'z', 's' you add an 'es'.
				--->
				<cfelseif listfindnocase(esDelim,right(thisWord,1))>
					<cfset returnString = "#returnString# #thisWord#es">
				<!---
					If a word ends in a vowel + 'y', you just add 's'
				--->
				<cfelseif right(thisWord,1) eq "y" && listfindnocase(vowels,left(right(thisWord,2),1))>
					<cfset returnString = "#returnString# #thisWord#s">
				<!---
					If the word ends in a consonant + 'y', you change the 'y' to an 'i' and add 'es'
				--->
				<cfelseif right(thisWord,1) eq "y">
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 1)#ies">
				<!---
					If the word ends in 'is', you change the 'is' to 'es'
				--->
				<cfelseif listfindnocase("is",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#es">
				<!---
					If the word ends in 'us', you change the 'us' to 'i'
				--->
				<cfelseif listfindnocase("us",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#i">
				<!---
					If the word ends in 'ix', you change the 'ix' to 'ices'
				--->
				<cfelseif listfindnocase("ix",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#ices">
				<!---
					If the word ends in 'eau', you change the 'eau' to 'eaus'
				--->
				<cfelseif listfindnocase("eau",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#eaus">
				<!---
					Normal return: you just add an 's'
				--->
				<cfelseif len(trim(thisWord)) gt 3 >
					<!---
						This is a bit of a sticking point as most words with 3 or less characters ussually dont work well with adding an s
						Need to research this more to determine a better way to handle this.
					--->
					<cfset returnString = "#returnString# #thisWord#s#iif(addFarwardSlashToEnd,de("/"),de(""))#" />
				<cfelse>
					<cfset returnString = "#returnString# #thisWord##iif(addFarwardSlashToEnd,de("/"),de(""))#" />
				</cfif>

		</cfloop>


<!---

		<cfloop from="1" to="#arraylen(javaArray)#" index="loopWord">
			<cfset thisWord = trim(javaArray[loopWord])>
			<!---
				Need to acount for a / at the end of a word
				Remove the / and add it back in at the end.
			--->
			<cfif right(thisWord,1) eq "/">
				<cfset thisWord = left(thisWord,len(thisWord) - 1)>
				<cfset addFarwardSlashToEnd = true>
			<cfelse>
				<cfset addFarwardSlashToEnd = false>
			</cfif>

			<!--- Loop for additional conditions full word replacements --->
			<cfset returnString = "#returnString#" />

				<!---
					If the word ends in 'ss', 'ch', 'sh' you add an 'es'.
				--->
				<cfif listfindnocase(esDelim,right(thisWord,2))>
					<cfset returnString = "#returnString# #thisWord#es#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					If the word ends in 'x', 'z', 's' you add an 'es'.
				--->
				<cfelseif listfindnocase(esDelim,right(thisWord,1))>
					<cfset returnString = "#returnString# #thisWord#es#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					If a word ends in a vowel + 'y', you just add 's'
				--->
				<cfelseif right(thisWord,1) eq "y" && listfindnocase(vowels,left(right(thisWord,2),1))>
					<cfset returnString = "#returnString# #thisWord#s#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					If the word ends in a consonant + 'y', you change the 'y' to an 'i' and add 'es'
				--->
				<cfelseif right(thisWord,1) eq "y">
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 1)#ies#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					If the word ends in 'is', you change the 'is' to 'es'
				--->
				<cfelseif listfindnocase("is",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#es#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					If the word ends in 'us', you change the 'us' to 'i'
				--->
				<cfelseif listfindnocase("us",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#i#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					If the word ends in 'ix', you change the 'ix' to 'ices'
				--->
				<cfelseif listfindnocase("ix",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#ices#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					If the word ends in 'eau', you change the 'eau' to 'eaus'
				--->
				<cfelseif listfindnocase("eau",right(thisWord,2))>
					<cfset returnString = "#returnString# #left(thisWord,len(thisWord) - 2)#eaus#iif(addFarwardSlashToEnd,de("/"),de(""))#">
				<!---
					Normal return: you just add an 's'
				--->
				<cfelseif len(trim(thisWord)) gt 3 >
					<cfset returnString = "#returnString# #thisWord#s#iif(addFarwardSlashToEnd,de("/"),de(""))#" />
				<cfelse>
					<cfset returnString = "#returnString# #thisWord##iif(addFarwardSlashToEnd,de("/"),de(""))#" />
				</cfif>

		</cfloop>
--->




		<cfif len(returnString) eq 0>
			<cfset returnString = arguments.inputString />
		<cfelse>
			<!---cfif FindNoCase("/  ", returnString)>
				<cfset returnString = replace(returnString,"/  ","/","all") />
			<cfelseif FindNoCase("/ ", returnString)>
				<cfset returnString = replace(returnString,"/ ","/","all") />
			</cfif--->

			<cfset returnString = trim(returnString) />
		</cfif>

		<!---
			Replace specail ascii versions with the corect character.
			The # is removed due to issues with coldfusion.
		--->
		<cfloop list="#delims#" index="x">
			<cfset returnString = replace(returnString, " #HTMLCodeFormat(x)#", x, "all") />
		</cfloop>
		<cfset returnString = replace(returnString, "/ ",   "/", "all") />
		<!----cfset returnString = replace(returnString, " &##63", "?", "all")>
		<cfset returnString = replace(returnString, " &##46", ".", "all")>
		<cfset returnString = replace(returnString, " &##44", ",", "all")>
		<cfset returnString = replace(returnString, " &##33", "!", "all")>
		<cfset returnString = replace(returnString, " &##47", "/", "all")>
		<cfset returnString = replace(returnString, "/ ",   "/", "all")---->

		<cfreturn returnString />
	</cffunction>


	<cffunction name="specialCases" access="public" returntype="string" output="false">
		<cfargument name="inputword" type="string" required="true">

		<cfset var returnWord = "">


		<cfswitch expression="#trim(arguments.inputword)#">
		    <cfcase value="child">
				<cfset returnWord = "children">
		    </cfcase>
		    <cfcase value="man">
				<cfset returnWord = "men">
		    </cfcase>
		    <cfcase value="ox">
				<cfset returnWord = "oxen">
		    </cfcase>
		    <cfcase value="woman">
				<cfset returnWord = "women">
		    </cfcase>
			<cfcase value="bacterium">
				<cfset returnWord = "bacteria">
		    </cfcase>
			<cfcase value="corpus">
				<cfset returnWord = "corpora">
		    </cfcase>
			<cfcase value="criterion">
				<cfset returnWord = "criteria">
		    </cfcase>
			<cfcase value="curriculum">
				<cfset returnWord = "curricula">
		    </cfcase>
			<cfcase value="datum">
				<cfset returnWord = "data">
		    </cfcase>
			<cfcase value="genus">
				<cfset returnWord = "genera">
		    </cfcase>
			<cfcase value="medium">
				<cfset returnWord = "media">
		    </cfcase>
			<cfcase value="memorandum">
				<cfset returnWord = "memoranda">
		    </cfcase>
			<cfcase value="phenomenon">
				<cfset returnWord = "phenomena">
		    </cfcase>
			<cfcase value="stratum">
				<cfset returnWord = "strata">
		    </cfcase>
			<cfcase value="foot">
				<cfset returnWord = "feet">
			</cfcase>
			<cfcase value="goose">
				<cfset returnWord = "geese">
			</cfcase>
			<cfcase value="tooth">
				<cfset returnWord = "teeth">
			</cfcase>
			<cfcase value="antenna">
				<cfset returnWord = "antennas">
			</cfcase>
			<cfcase value="formula">
				<cfset returnWord = "formulas">
			</cfcase>
			<cfcase value="nebula">
				<cfset returnWord = "nebulae">
			</cfcase>
			<cfcase value="vertebra">
				<cfset returnWord = "vertebrae">
			</cfcase>
			<cfcase value="vita">
				<cfset returnWord = "vitae">
			</cfcase>
			<cfcase value="louse">
				<cfset returnWord = "lice">
			</cfcase>
			<cfcase value="mouse">
				<cfset returnWord = "mice">
			</cfcase>
		</cfswitch>


		<cfreturn returnWord>
	</cffunction>

</cfcomponent>