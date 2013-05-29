<cfcomponent output="false">

	<cffunction name="init" output="false" access="public" returntype="component">
		<cfargument name="args" type="struct" required="true" />
   		<cfset variables.args = arguments.args />                
       
         <cfreturn this />
   	</cffunction>
    
	<cffunction name="validateString" output="false" access="public" returntype="string">
	    <cfargument name="field" type="string" required="true" />

        <!--- validate for empty strings --->
        <cfif len(trim(variables.args[field])) eq 0>
			<cfreturn arguments.field />        
        <cfelse>
			<cfreturn "" /><!--- Return empty string means valid --->    
        </cfif>
  	</cffunction>    
    
    
	<cffunction name="validatePhone" output="false" access="public" returntype="string">
	    <cfargument name="field" type="string" required="true" />
        
		<cfif !refindnocase("^(([0-9]{3}-)|\([0-9]{3}\) ?)?[0-9]{3}-[0-9]{4}$", variables.args[field])>
			<cfreturn field />        
        <cfelse>
			<cfreturn "" /><!--- Return empty string means valid --->    
        </cfif>        
        
		<cfreturn field />
   	</cffunction> 
    
	<cffunction name="validateEmail" output="false" access="public" returntype="string">
	    <cfargument name="field" type="string" required="true" />

		<cfif !refindnocase("^.+@.+\..+$", variables.args[field])>
			<cfreturn field />        
        <cfelse>
			<cfreturn "" /><!--- Return empty string means valid --->    
        </cfif>        

   	</cffunction>      

</cfcomponent> 