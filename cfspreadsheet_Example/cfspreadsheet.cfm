Testing cfspreadsheet<br />


<!--- Generate Query data --->
    <cfscript>
    	theDir = GetDirectoryFromPath(GetCurrentTemplatePath());
    	theFile = theDir & "people.xlsx";

        qryPeople = queryNew(
        	'firstname, lastname, email',
            'varChar, varChar, varChar',
            [
            	{
					firstname:'Jeff',
					lastname:'Sample',
					email:'Jeff@sample.com'
				},{
					firstname:'Mark',
					lastname:'Sample',
					email:'Mark@sample.com'
				},{
					firstname:'Tom',
					lastname:'Sample',
					email:'Tom@sample.com'
                }
            ]
        );

        qryPeople2 = queryNew(
        	'firstname, lastname, email',
            'varChar, varChar, varChar',
            [
            	{
					firstname:'Sam',
					lastname:'Sample',
					email:'Sam@sample.com'
				},{
					firstname:'Sammy',
					lastname:'Sample',
					email:'Sammy@sample.com'
				},{
					firstname:'Joe',
					lastname:'Sample',
					email:'Joe@sample.com'
                }
            ]
        );

        writeDump(qryPeople);
    </cfscript>

Spreadsheet Created<br />
<!--- create a new spreadsheet --->
<cfspreadsheet
    action="write"
    filename = "#theFile#"
    overwrite = "true"
    query = "qryPeople"
    sheetname = "sheet1" />

Spreadsheet Created<br />
<!--- update the spreadsheet --->
<cfspreadsheet
    action="update"
    filename = "#theFile#"
    query = "qryPeople2"
    sheetname = "names" >

Email Spreadsheet<br />
<!--- attach the spreadsheet and email --->
<cfmail to = "owner@sample.com"
		from = "reports@wolfnet.com"
		subject = "Your weekly report">
		    <cfmailparam
        		contentID = "report"
       			disposition = "attachment"
        		file = "#theFile#"
        		type ="html"  />

                This message was sent by an automatic mailer built with cfmail:
                = = = = = = = = = = = = = = = = = = = = = = = = = = =
                ATTACHMENT
        </cfmail>


<!--- END --->