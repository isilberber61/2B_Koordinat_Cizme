📐 2B KOORDİNAT TABANLI ŞEKİL ÇİZİM UYGULAMASI

(ASP Classic – VBScript)

📌 Proje Hakkında

Bu proje, kullanıcıdan alınan 2B koordinat verilerinin sunucu tarafında saklanarak, şekil türüne göre otomatik çizilmesini sağlayan web tabanlı bir uygulamadır.
Uygulama, ASP Classic (VBScript) kullanılarak geliştirilmiş olup, veriler Microsoft Access (.mdb) veritabanında tutulmaktadır.

Kullanıcılar;

Nokta ekleyebilir

Şekil türü seçebilir (Üçgen, Kare, Daire vb.)

Noktaları veritabanına kaydedebilir

Şekilleri canvas üzerinde görselleştirebilir

Eklenen noktaları listeleyebilir

Noktaları tek tek silebilir

🎯 Projenin Amacı

Sunucu taraflı programlamada ASP Classic kullanımını pekiştirmek

Veritabanı ile etkileşimli dinamik web uygulaması geliştirmek

Kullanıcıdan alınan verilerin işlenmesi, saklanması ve görselleştirilmesini sağlamak

Canvas kullanarak grafik çizim mantığını uygulamak

CRUD (Create – Read – Delete) işlemlerini gerçek bir senaryoda göstermek

🛠️ Kullanılan Teknolojiler
Katman	Teknoloji
Sunucu Tarafı	ASP Classic (VBScript)
Veritabanı	Microsoft Access (.mdb)
Ön Yüz	HTML5, CSS3
Grafik Çizimi	HTML5 Canvas + JavaScript
Sunucu	IIS (Internet Information Services)
📂 Proje Klasör Yapısı
/proje-klasoru
│
├── index.asp        → Nokta ekleme sayfası
├── kaydet.asp       → Veritabanına kayıt işlemi
├── ciz.asp          → Şekil çizim ve listeleme sayfası
├── sil.asp          → Nokta silme işlemi
│
├── /db
│   └── koordinatlar.mdb
│
├── /assets
│   └── style.css

📄 Sayfa Açıklamaları
🔹 index.asp

Bu sayfa, uygulamanın giriş noktasıdır.
Kullanıcıdan aşağıdaki bilgiler alınır:

X koordinatı

Y koordinatı

Çizim sırası (sira)

Şekil türü (Üçgen, Kare, Daire, Serbest)

Girilen veriler POST yöntemiyle kaydet.asp sayfasına gönderilir.
Ayrıca kullanıcı, dilerse çizim sayfasına yönlendirilebilir.

🔹 kaydet.asp

Bu sayfa, formdan gelen verileri alır ve doğrular.

Gerçekleştirilen işlemler:

Boş alan kontrolü

Sayısal değer dönüşümleri (CLng)

Veritabanı bağlantısı

Points tablosuna INSERT işlemi

Kullanıcıya işlem sonucu bildirimi

Başarılı kayıt sonrası kullanıcıya bilgi mesajı gösterilir.

🔹 ciz.asp

Bu sayfa, uygulamanın en kritik bileşenidir.

Gerçekleştirilen işlemler:

Veritabanından tüm kayıtları okur

Kayıtları JSON formatına dönüştürerek JavaScript’e aktarır

Noktaları shapeID / shapeType bazlı gruplar

Şekil türüne göre otomatik çizim yapar:

Üçgen → 3 nokta

Kare → 4 nokta

Daire → Merkez + yarıçap noktası

Şekilleri otomatik kapatır

Noktaların yanına koordinat etiketlerini yazar

Sağ tarafta kayıt listesini tablo halinde gösterir

Her kayıt için Sil butonu sunar

Çizimler HTML5 Canvas üzerinde gerçekleştirilir.

🔹 sil.asp

Bu sayfa, URL üzerinden gelen ID bilgisine göre ilgili kaydı veritabanından siler.

ID kontrolü yapılır

DELETE sorgusu çalıştırılır

İşlem sonrası ciz.asp sayfasına geri yönlendirme yapılır

🎨 Şekil Çizim Mantığı

Aynı şekil türüne sahip noktalar gruplanır

Noktalar sira alanına göre sıralanır

Şekil türüne göre uygun çizim fonksiyonu çağrılır

Her şekil farklı renkte çizilir

Şekil üzerine ikonlu etiket eklenir:

▲ Üçgen

■ Kare

● Daire

🧪 Test Senaryoları

Farklı şekil türleri için doğru nokta sayısı girildiğinde çizim yapılır

Eksik nokta girildiğinde çizim yapılmaz

Silme işleminden sonra liste ve çizim güncellenir

Veritabanı boşken sistem hata vermez

📌 Sonuç

Bu proje ile;

ASP Classic kullanılarak tam fonksiyonel bir sunucu taraflı uygulama

Veritabanı bağlantılı dinamik veri yönetimi

Canvas ile görsel şekil çizimi

Kullanıcı dostu arayüz ve iş akışı

başarıyla gerçekleştirilmiştir.

Proje, sunucu taraflı programlama, veri tabanı yönetimi ve ön yüz etkileşimi konularını birlikte ele alan bütüncül bir örnek sunmaktadır.