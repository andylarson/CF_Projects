<!--- Force defaults to avoid any errors --->
<cfparam name="form.firstName" default="" />
<cfparam name="form.lastName"  default="" />
<cfparam name="form.phone"     default="" />
<cfparam name="form.cell"      default="" />
<cfparam name="form.email"     default="" />


<!--- Copy all form values into args --->
<cfset args = {} />
<cfset args = form />

<!--- Start server side validation --->
<cfset validation = createObject( 'component', 'validation').init(args) />
<cfset errorList = "" /> <!--- Creates a list of invalid fields --->

<!--- loop over form fields to validate using the correct validator --->
<cfloop list="#args.fieldnames#" index="i">
	<cfif !listfindnocase("fieldnames,dateTime,submit,type",i)><!--- do not validate these form items --->

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
	<!--- If there is an error stop and send the user back to the form --->
	<cfset errorList = REReplace(errorList, ",$", "") /> <!--- Needed to remove the last comma --->
	<cfinclude template="signup.cfm" />
    <cfabort>
</cfif>

<!--- Insert data into the logging database --->
<cftry>
	<cfquery name="setSignupForm" datasource="logging">
		insert into logging (
            firstName,
            lastName,
            phone,
            cell,
            email,
            type,
            dateTime
		) values (
        	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#trim(form.firstName)#" null="#!len(trim(form.firstName))#" />
        	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#trim(form.lastName)#"  null="#!len(trim(form.lastName))#" />
        	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#trim(form.phone)#"     null="#!len(trim(form.phone))#" />
        	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#trim(form.cell)#"      null="#!len(trim(form.cell))#" />
        	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#trim(form.email)#"     null="#!len(trim(form.email))#" />                                                 
        	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#form.type#" />                                                 
        	<cfqueryparam cfsqltype="cf_sql_timestamp" value="#form.dateTime#" />                                                                         
        )		        
    </cfquery> 
	<cfcatch type="database">
    	<cflog text="Error recording signup form" type="error" application="yes" />
    </cfcatch>
</cftry>



<!--- Now lets kickoff an email to alert of the new signup --->
<cfoutput>
    <cfsavecontent variable="emailBody">
        <font face="Arial,Helvetica,sans-serif">
        <b>New Signup</b><br /><br />
        <b>First Name:</b> #trim(form.firstName)#<br />
        <b>Last Name:</b> #trim(form.lastName)#<br />
        <b>Phone</b>: #trim(form.phone)#<br />
        <b>Cell:</b> #trim(form.cell)#<br />
        <b>Email:</b> #trim(form.email)#<br />
        <b>Type:</b> #form.type#<br />
        <b>Date Time:</b> #form.dateTime#<br />
    </cfsavecontent>
</cfoutput>

<cfmail to      = "andy@test.com"
        from    = "#trim(form.email)#"
        replyto = "#trim(form.email)#"
        subject = "New Signup">
    <cfmailpart type="text/plain">#textMessage(emailBody)#</cfmailpart>
    <cfmailpart type="text/html">#emailBody#</cfmailpart>
</cfmail>


<!DOCTYPE html>
<html>
	<head>
		<title>Sample Form</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body style="text-align:center">
    	<h1>Thank you</h1><br /><br />
        <div>Thank you for signing up with us!</div>        
    </body>
</html>



<!--- 
	http://cookbooks.adobe.com/post_CFMAIL_the_right_way-17875.html 
	This code strips HTML elements while preserving line breaks.
--->
<cffunction name= "textMessage" access= "public" returntype= "string" hint= "Converts an html email message into a nicely formatted with line breaks plain text message">
	<cfargument name= "string" required= "true" type= "string">
	<cfscript>
		var pattern = " <br>";
	    var CRLF = chr( 13) & chr( 10);
	    var message = ReplaceNoCase(arguments.string, pattern, CRLF , "ALL");
	
	    pattern = "<[^>]*>";
	</cfscript>

    <cfreturn REReplaceNoCase(message, pattern, "" , "ALL")>
</cffunction>