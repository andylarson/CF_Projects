<!DOCTYPE html>
<html>
	<head>
		<title>Sample Form</title>
		<link rel="stylesheet" type="text/css" href="style.css">
        <!--- Include Jquery --->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
        <!--- Include Front Facing Validation --->
		<script src="script.js"></script>
	</head>
	<body>
		<!--- Defaults values to empty --->
		<cfparam name="form.firstName" default="" />
		<cfparam name="form.lastName"  default="" />
		<cfparam name="form.phone"     default="" />
		<cfparam name="form.cell"      default="" />
		<cfparam name="form.email"     default="" />
		<cfparam name="form.email"     default="" />
        <cfparam name="errorList"      default="" />

		<h1>Sample Form</h1>
		<div id="errorMessage"></div>
		<div id="message">* Indecates a Required Field</div>
		<!--- A basic form for collections data --->
		<form name="sample" id="sample" method="post" action="signup_action.cfm" onSubmit="return validateForm();">
			<cfoutput>
				<table>
					<tr>
						<td class="label #iif(listfindnocase(errorList,"firstName"),de("red"),de(""))#" id="firstNameLabel">*First Name</td>
						<td class="userInput"><input type="text" name="firstName" id="firstName" value="#form.firstName#" /></td>
					</tr>
					<tr>
						<td class="label #iif(listfindnocase(errorList,"lastName"),de("red"),de(""))#" id="lastNameLabel">*Last Name</td>
						<td class="userInput"><input type="text" name="lastName" id="lastName" value="#form.lastName#" /></td>
					</tr>
					<tr>
						<td class="label #iif(listfindnocase(errorList,"phone"),de("red"),de(""))#" id="phoneLabel">*Phone Number</td>
						<td class="userInput"><input type="text" name="phone" id="phone" value="#form.phone#" />(xxx-xxx-xxxx)</td>
					</tr>
					<tr>
						<td class="label #iif(listfindnocase(errorList,"cell"),de("red"),de(""))#" id="cellLabel">*Cell Phone Number</td>
						<td class="userInput"><input type="text" name="cell" id="cell" value="#form.cell#" />(xxx-xxx-xxxx)</td>
					</tr>
					<tr>
						<td class="label #iif(listfindnocase(errorList,"email"),de("red"),de(""))#" id="emailLabel">*Email Address</td>
						<td class="userInput"><input type="text" name="email" id="email" value="#form.email#" /></td>
					</tr>
					<tr>
						<td></td>
						<td class="userButton" ><input type="submit" name="submit" id="submit" value="Submit" /></td>
					</tr>
				</table>
				<input type="hidden" name="type" value="contact" />
				<input type="hidden" name="dateTime" value="#createodbcdatetime(now())#" />
			</cfoutput>
		</form>
	</body>
</html>