<!--- Force defaults to avoid any errors --->
<cfparam name="form.firstName" default="" />
<cfparam name="form.lastName"  default="" />
<cfparam name="form.phone"     default="" />
<cfparam name="form.cell"      default="" />
<cfparam name="form.email"     default="" />
<cfparam name="form.email"     default="" />

<!--- copy all form values into args --->
<cfset args = {} />
<cfset args = form />

<!--- Start server side validation --->
<cfset validation = createObject( 'component', 'validation').init(args) />
<cfset errorList = "" /> <!--- Creates a list of invalid fields --->

<!--- loop over form fields to validate using the corrent validator --->
<cfloop list="#args.fieldnames#" index="i">
	<cfif !listfindnocase("fieldnames,dateTime,submit,type",i)><!--- do not validate these --->

        <cfif listfindnocase("firstName,lastName",i)>
        	<cfset errorList = listappend(errorList, validation.validateString(i)) />
        </cfif>  
        <cfif listfindnocase("phone,cell",i)>
        	<cfset errorList = listappend(errorList, validation.validatePhone(i)) />
        </cfif>    
        <cfif listfindnocase("email",i)>
        	<cfset errorList = listappend(errorList, validation.validateEmail(i)) />
        </cfif>     
                   
    </cfif>	
</cfloop>

<cfif listlen(errorList) gt 0>
	<cfset errorList = REReplace(errorList, ",$", "") /> <!--- Needed to remove thelast comma --->
	<cfinclude template="signup.cfm">
    <cfabort>
</cfif>