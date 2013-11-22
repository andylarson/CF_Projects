<cfloop index="thefield" list="#form.fieldnames#">
  <cfset fields="#thefield# = #evaluate(thefield)#">
  <cfoutput>#fields#</cfoutput><br>
</cfloop>