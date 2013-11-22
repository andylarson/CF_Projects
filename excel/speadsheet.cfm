<cfsetting showdebugoutput="false">
<cfheader name="content-disposition" value="inline;filename=sample.xls">
<cfcontent type="application/msexcel">
<?xml version="1.0"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
    <Worksheet ss:Name="Retail">
        <ss:Table>
            <Row>
                <cfoutput>Retail</cfoutput>
            </Row>
            <Row>
                <Cell ss:Index="1">
                    <Data ss:Type="String">Value 1.1</Data>
                </Cell>
                <Cell ss:Index="2">
                    <Data ss:Type="String">Value 1.2</Data>
                </Cell>
            </Row>
        </ss:Table>
    </Worksheet>
    <Worksheet ss:Name="KW Agents">
        <ss:Table>
            <Row>
                <Cell ss:Index="1">
                    <Data ss:Type="String">Column 2.1</Data>
                </Cell>
                <Cell ss:Index="2">
                    <Data ss:Type="String">Column 2.2</Data>
                </Cell>
            </Row>
            <Row>
                <Cell ss:Index="1">
                    <Data ss:Type="String">Value 2.1</Data>
                </Cell>
                <Cell ss:Index="2">
                    <Data ss:Type="String">Value 2.2</Data>
                </Cell>
            </Row>
        </ss:Table>
    </Worksheet>
    <Worksheet ss:Name="KW Market Centers">
        <ss:Table>
            <Row>
                <Cell ss:Index="1">
                    <Data ss:Type="String">Column 2.1</Data>
                </Cell>
                <Cell ss:Index="2">
                    <Data ss:Type="String">Column 2.2</Data>
                </Cell>
            </Row>
            <Row>
                <Cell ss:Index="1">
                    <Data ss:Type="String">Value 2.1</Data>
                </Cell>
                <Cell ss:Index="2">
                    <Data ss:Type="String">Value 2.2</Data>
                </Cell>
            </Row>
        </ss:Table>
    </Worksheet>
</Workbook>