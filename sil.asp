<%@ Language=VBScript %>
<%
id = Request.QueryString("id")

dbPath = Server.MapPath("db/koordinatlar.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath

conn.Execute "DELETE FROM Points WHERE ID=" & id

conn.Close

Response.Redirect("ciz.asp")
%>
