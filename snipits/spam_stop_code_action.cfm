

<cfoutput>

	<cfif !isDefined("form.authorized_mail_code") or !IsDefined("session.authorized_mail_code") or form.authorized_mail_code neq hash(session.authorized_mail_code)>
		<cfscript>
			  //delete the authorized mail code so it can not be reused
			  if (isDefined("session.authorized_mail_code")) {
			    session.authorized_mail_code = "";
			    StructDelete(session, 'authorized_mail_code');
			  }
		</cfscript>
		STOP!
		<cfabort>
		<!--- <cflocation url="#cgi.script_name#" addtoken="No"> --->
	</cfif>



	#form.name#<br />
	#form.email#<br />
	#form.phone#<br />

</cfoutput>
