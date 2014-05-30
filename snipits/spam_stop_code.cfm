
    	<form name="contactform" action="spam_stop_code_action.cfm" method="post">

        	<table cellspacing="10" style="position:relative;" border="0" align="center">
      			<tr>
     				<td class="align_right"><label for="name"><h3>*Name:</h3></label></td>
					<td><input type="text" name="name" id="name" size="30" class="input"></td>
				</tr>
      			<tr>
     				<td class="align_right"><label for="email"><h3>*E-mail:</h3></label></td>
					<td><input type="text" name="email" id="email" size="30" class="input"></td>
				</tr>
      			<tr>
     				<td class="align_right"><label for="phone"><h3>Phone Number:</h3></label></td>
					<td><input type="text" name="phone" id="phone" size="30" class="input"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
              			<input name="submit" type="submit" value="Submit" />
              			&nbsp;&nbsp;&nbsp;
             			<input name="submit" type="reset" value="Reset" />
					</td>
				</tr>
			</table>
	        <!--- create authorized mail code --->
    	    <cfset session.authorized_mail_code = getGuid() />
        	<cfoutput>
          		<input type="text" name="authorized_mail_code" id="authorized_mail_code" value="#Hash(session.authorized_mail_code)#">
        	</cfoutput>
      	</form>



<cffunction name="getGuid" returntype="string" access="private">
	<cfset var guid = "" />
	<cfset guid = createUUID()>
	<cfset guid = lcase(left(guid, 23) & "-" & right(guid, 12))>

	<cfreturn guid />
</cffunction>

