<%@ Language=VBScript %>

<%
dbPath = Server.MapPath("db/koordinatlar.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath

sql = "SELECT * FROM Points ORDER BY shapeID, sira"
Set rs = conn.Execute(sql)

json = "["
rowsHtml = ""
pointCount = 0

Do While Not rs.EOF
    pointCount = pointCount + 1

    json = json & "{""id"":" & rs("ID") & _
                 ",""x"":" & rs("x") & _
                 ",""y"":" & rs("y") & _
                 ",""sira"":" & rs("sira") & _
                 ",""shapeID"":" & rs("shapeID") & "},"

    rowsHtml = rowsHtml & "<tr>" & _
        "<td>" & rs("ID") & "</td>" & _
        "<td>" & rs("x") & "</td>" & _
        "<td>" & rs("y") & "</td>" & _
        "<td>" & rs("sira") & "</td>" & _
        "<td>" & rs("shapeID") & "</td>" & _
        "<td><a href='sil.asp?id=" & rs("ID") & "' style='color:#f87171'>Sil</a></td></tr>"

    rs.MoveNext
Loop

If Right(json,1) = "," Then json = Left(json, Len(json)-1)
json = json & "]"

rs.Close
conn.Close
%>

<html>
<head>
<meta charset="utf-8" />
<title>Çizim</title>
<link rel="stylesheet" href="assets/style.css">
</head>

<body>

<div class="app-wrapper">
<div class="card">

<div class="app-header">
    <div>
        <div class="app-title">Şekil Çizimi</div>
        <div class="app-subtitle">ShapeID gruplarına göre çizim yapılır.</div>
    </div>
    <div class="app-nav">
        <a href="index.asp">Koordinat Ekle</a>
        <a href="ciz.asp">Yenile</a>
    </div>
</div>

<div class="layout-two-columns">

<div class="canvas-wrapper">
    <div class="canvas-header">
        <span>Çizim Alanı</span>
        <span class="badge badge-info"><%=pointCount%> nokta</span>
    </div>
    <canvas id="cizim" width="600" height="600"></canvas>
</div>

<div>
    <div class="section-title">Koordinat Listesi</div>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr><th>ID</th><th>X</th><th>Y</th><th>Sıra</th><th>ShapeID</th><th>Sil</th></tr>
            </thead>
            <tbody><%=rowsHtml%></tbody>
        </table>
    </div>
</div>

</div>
</div>
</div>

<script>
var data = <%=json%>;
var canvas = document.getElementById("cizim");
var ctx = canvas.getContext("2d");

ctx.clearRect(0,0,600,600);

// shapeID gruplama
var groups = {};
data.forEach(p=>{
    if(!groups[p.shapeID]) groups[p.shapeID] = [];
    groups[p.shapeID].push(p);
});

// renk paleti
var colors = ["#ef4444","#22c55e","#3b82f6","#f97316","#a855f7"];

var colorIndex = 0;

Object.keys(groups).forEach(function(gid){

    var pts = groups[gid].sort((a,b)=>a.sira-b.sira);
    var color = colors[colorIndex % colors.length];
    colorIndex++;

    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 2;

    ctx.moveTo(pts[0].x, pts[0].y);

    for(var i=1;i<pts.length;i++){
        ctx.lineTo(pts[i].x, pts[i].y);
    }

    // otomatik kapatma
    ctx.lineTo(pts[0].x, pts[0].y);
    ctx.stroke();

    // noktalar
    pts.forEach(p=>{
        ctx.fillStyle = color;
        ctx.beginPath();
        ctx.arc(p.x,p.y,4,0,Math.PI*2);
        ctx.fill();
        ctx.fillText("(" + p.x + "," + p.y + ")", p.x+6, p.y-6);
    });

});
</script>

</body>
</html>
