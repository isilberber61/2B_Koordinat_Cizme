<%@ Language=VBScript %>
<%
x = Trim(Request.Form("x"))
y = Trim(Request.Form("y"))
sira = Trim(Request.Form("sira"))
shapeID = Trim(Request.Form("shapeID"))

If x="" OR y="" OR sira="" OR shapeID="" Then
    Response.Write("Eksik bilgi")
    Response.End
End If

dbPath = Server.MapPath("db/koordinatlar.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath

sql = "INSERT INTO Points (x,y,sira,shapeID) VALUES (" & x & "," & y & "," & sira & "," & shapeID & ")"
conn.Execute sql

conn.Close
%>

<script>
alert("Saved succesfully!");
window.location.href="index.asp";
</script>
