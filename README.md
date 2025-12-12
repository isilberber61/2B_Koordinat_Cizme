# 2B Koordinat Çizim Uygulaması (ASP Classic + Access MDB) – Teknik Tasarım Dokümanı

## Genel Bakış

Bu proje, kullanıcıdan alınan **2B koordinatları (X, Y)** veritabanına kaydedip, **sıra (sira)** bilgisine göre noktaları birleştirerek **Canvas üzerinde şekil çizen** web tabanlı bir uygulamadır.  
Uygulama **ASP Classic (VBScript)** ile geliştirilmiştir. Veri kaynağı **Access (.mdb)** dosyasıdır.

Uygulama ayrıca:
- Noktaları tablo halinde listeler,
- Şekli otomatik kapatır,
- Nokta koordinatlarını noktanın yanında yazar,
- **Silme** özelliği sunar.

---

## Sistem Yapısı

### Modüller

- **Koordinat Giriş Modülü (index.asp)**  
  Kullanıcıdan X, Y, sıra ve shapeID alır.

- **Kayıt Modülü (kaydet.asp)**  
  Form verilerini doğrular ve veritabanına INSERT eder.

- **Çizim + Listeleme Modülü (ciz.asp)**  
  Verileri DB’den okur, Canvas üzerinde çizer, tabloyu üretir.

- **Silme Modülü (sil.asp)**  
  Seçilen kaydı veritabanından siler ve ciz.asp’ye geri döner.

### Veri Kaynağı

- `db/koordinatlar.mdb`
- Örnek tablo: `Points`

Önerilen alanlar:
- `ID` (AutoNumber / Primary Key)
- `x` (Number)
- `y` (Number)
- `sira` (Number)
- `shapeID` (Number)  → Aynı shapeID = aynı şekil

---

## İşlevler

### 1) Koordinat Ekleme (index.asp)
- Kullanıcı:
  - X koordinatı
  - Y koordinatı
  - Sıra (çizim sırası)
  - ShapeID (hangi şekle ait)
  bilgilerini girer.
- Form, `kaydet.asp` sayfasına **POST** edilir.
- Kullanıcı isterse çizim ekranına geçebilir.

### 2) Veriyi Kaydetme (kaydet.asp)
- Boş alan kontrolü yapılır.
- DB bağlantısı kurulur.
- INSERT işlemi ile kayıt eklenir.
- Başarı/başarısızlık durumu kullanıcıya gösterilir.

### 3) Verileri Okuma + Çizim (ciz.asp)
Bu sayfa 6 temel işi yapar:

1. **Veritabanından kayıtları okur**  
   `SELECT ... ORDER BY shapeID, sira`

2. **Veriyi JavaScript’e aktarır**  
   Sunucuda JSON string üretilir ve `<script>` içine gömülür.

3. **Şekilleri otomatik çizer**  
   - Aynı shapeID altındaki noktalar gruplanır.
   - Noktalar `sira` sırasına göre çizgi ile birleştirilir.
   - İlk noktaya geri dönerek şekil kapatılır.

4. **Nokta etiketlerini yazar**  
   Her noktanın yanına `(x,y)` etiketi basılır.

5. **Kayıt listesini görüntüler**  
   Sağ tarafta tablo halinde tüm noktalar listelenir.

6. **Silme butonu sunar**  
   Her satırda `sil.asp?id=...` linki ile kayıt silinebilir.

### 4) Silme (sil.asp)
- URL’den gelen `id` alınır.
- `DELETE FROM Points WHERE ID = ...` çalışır.
- İşlem sonrası `ciz.asp` sayfasına yönlendirilir.

---

## Sayfalar (ASP Dosyaları)

- **index.asp**  
  Form ekranı (X, Y, sıra, shapeID) + yönlendirme linkleri

- **kaydet.asp**  
  DB INSERT + kullanıcıya başarı mesajı

- **ciz.asp**  
  DB SELECT + JSON üretme + Canvas çizimi + tablo listeleme + sil linkleri

- **sil.asp**  
  DB DELETE + geri yönlendirme

- **assets/style.css**  
  UI/UX tasarım (kart, buton, form, tablo, canvas alanı)

- **db/koordinatlar.mdb**  
  Access veritabanı dosyası

---

## Kurulum ve Çalıştırma (IIS)

1. IIS’i aç:
   - Windows özellikleri → IIS → **ASP** etkin olmalı
2. Proje klasörünü IIS’e ekle:
   - Site veya Virtual Directory
3. Veritabanı konumu:
   - `db/koordinatlar.mdb` proje içinde durmalı
4. Tarayıcıdan aç:
   - `http://localhost/<projeKlasoru>/index.asp`

> Not: Access için genelde Jet OLEDB provider kullanılır:  
> `Provider=Microsoft.Jet.OLEDB.4.0;Data Source=...`

---

## Kullanım Senaryosu (Hızlı Test)

Örnek kare (shapeID=1):
1. (100,100) sira=1
2. (250,100) sira=2
3. (250,250) sira=3
4. (100,250) sira=4

ciz.asp’de:
- 4 nokta çizgiyle bağlanır
- otomatik kapanır
- her noktanın yanında koordinat etiketi görünür

---

## Notlar / Sık Hatalar

- Canvas koordinatları 0–600 aralığına uygun olmalı (canvas 600x600).
- `sira` aynı şekil içinde benzersiz olmalı (çizim sırası karışmasın).
- DB dosyası OneDrive gibi izin problemi çıkaran dizinlerdeyse IIS erişemeyebilir.

---
