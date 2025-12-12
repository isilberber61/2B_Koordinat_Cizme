<%@ Language=VBScript %>
<html>
<head>
    <meta charset="utf-8" />
    <title>Koordinat Girişi</title>
    <link rel="stylesheet" href="assets/style.css">
</head>

<body>
<div class="app-wrapper">
<div class="card">

<div class="app-header">
    <div>
        <div class="app-title">2B Koordinat Çizim Uygulaması</div>
        <div class="app-subtitle">Koordinat ekle ve ShapeID’ye göre şekil çiz.</div>
    </div>
    <div class="app-nav">
        <a href="index.asp">Koordinat Ekle</a>
    </div>
</div>

<div class="section-title">Yeni Koordinat Ekle</div>
<form method="post" action="kaydet.asp">

<div class="form-grid">
    <div class="form-group">
        <label>X</label>
        <input type="number" name="x" required>
    </div>

    <div class="form-group">
        <label>Y</label>
        <input type="number" name="y" required>
    </div>

    <div class="form-group">
        <label>Sıra</label>
        <input type="number" name="sira" required>
    </div>

    <div class="form-group">
        <label>ShapeID</label>
        <input type="number" name="shapeID" required>
    </div>
</div>

<div class="btn-row">
    <button class="btn btn-primary" type="submit">Kaydet</button>
    <a class="btn btn-ghost" href="ciz.asp">Çizimi Gör</a>
</div>

</form>
</div>
</div>
</body>
</html>
