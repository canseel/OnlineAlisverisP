CREATE DATABASE OnlineAlisverisP

USE OnlineAlisverisP;

--TABLOLAR VE ÝLÝÞKÝLER

--Müþteri Tablosu
CREATE TABLE Musteri (
   id INT PRIMARY KEY, --her deðerin benzersiz olmasý için
   ad NVARCHAR(50),
   soyad NVARCHAR(50),
   email NVARCHAR(50),
   sehir NVARCHAR(50),
   kayit_tarihi DATE
);

--Ürün Tablosu
CREATE TABLE Urun (
    id INT PRIMARY KEY,
    ad NVARCHAR(50),
    fiyat DECIMAL(10,2),
    stok INT,
    kategori_id INT,
    satici_id INT,
    FOREIGN KEY (kategori_id) REFERENCES Kategori(id), --her ürünün bir kategorisi vardýr
    FOREIGN KEY (satici_id) REFERENCES Satici(id) --bir ürün bir satýcýya aittir
);

--Kategori Tablosu
CREATE TABLE Kategori (
    id INT PRIMARY KEY,
    ad NVARCHAR(50)
);

--Satýcý Tablosu
CREATE TABLE Satici (
    id INT PRIMARY KEY,
    ad NVARCHAR(50),
    adres NVARCHAR(150)
);

--Sipariþ Tablosu
CREATE TABLE Siparis (
    id INT PRIMARY KEY,
    musteri_id INT,
    tarih DATE,
    toplam_tutar DECIMAL(10,2),
    odeme_turu NVARCHAR(20),
    FOREIGN KEY (musteri_id) REFERENCES Musteri(id) --bir müþteri birden fazla sipariþ verebilir
);

--Sipariþ detaylarý tablosu
CREATE TABLE Siparis_Detay (
    id INT PRIMARY KEY,
    siparis_id INT,
    urun_id INT,
    adet INT,
    fiyat DECIMAL(10,2),
    FOREIGN KEY (siparis_id) REFERENCES Siparis(id),
    FOREIGN KEY (urun_id) REFERENCES Urun(id) --bir sipariþ birden fazla ürün içerebilir
);

--VERÝ EKLEME 

--Kategoriler
INSERT INTO Kategori (id, ad) VALUES
(1,'Elektronik Aletler'), (2,'Ev Eþyalarý'), (3,'Ofis Malzemeleri');

--Satýcýlar
INSERT INTO Satici (id, ad, adres) VALUES
(1,'Teknocu','Ýstanbul'),
(2,'RAFF','Ankara'),
(3,'Ofisim','Ýzmir');

--Müþteriler
INSERT INTO Musteri (id, ad, soyad, email, sehir, kayit_tarihi) VALUES
(1,'Ali','Yýlmaz','ali@mail.com','Ýstanbul','2025-01-15'),
(2,'Ayþe','Demir','ayse@mail.com','Ankara','2025-02-10'),
(3,'Mehmet','Kara','mehmet@mail.com','Ýzmir','2025-03-05'),
(4,'Fatma','Ak','fatma@mail.com','Bursa','2025-01-20'),
(5,'Ahmet','Çelik','ahmet@mail.com','Antalya','2025-02-12'),
(6,'Elif','Kaya','elif@mail.com','Ýstanbul','2025-03-22'),
(7,'Hakan','Öztürk','hakan@mail.com','Ankara','2025-01-30'),
(8,'Zeynep','Þahin','zeynep@mail.com','Ýzmir','2025-02-18'),
(9,'Can','Koç','can@mail.com','Bursa','2025-03-10'),
(10,'Merve','Arslan','merve@mail.com','Antalya','2025-01-25'),
(11,'Emre','Yýldýz','emre@mail.com','Ýstanbul','2025-02-05'),
(12,'Selin','Polat','selin@mail.com','Ankara','2025-03-12'),
(13,'Burak','Aydýn','burak@mail.com','Ýzmir','2025-01-28'),
(14,'Ece','Kurt','ece@mail.com','Bursa','2025-02-15'),
(15,'Okan','Özdemir','okan@mail.com','Antalya','2025-03-20'),
(16,'Deniz','Güneþ','deniz@mail.com','Ýstanbul','2025-01-10'),
(17,'Seda','Bulut','seda@mail.com','Ankara','2025-02-08'),
(18,'Tunç','Çetin','tunc@mail.com','Ýzmir','2025-03-25'),
(19,'Derya','Koçak','derya@mail.com','Bursa','2025-01-18'),
(20,'Barýþ','Yalçýn','baris@mail.com','Antalya','2025-02-22');

--Ürünler
INSERT INTO Urun (id, ad, fiyat, stok, kategori_id, satici_id) VALUES
(1,'Laptop',7500,10,1,1),
(2,'Mouse',150,50,1,1),
(3,'Keyboard',250,40,1,1),
(4,'Monitor',1800,15,1,1),
(5,'USB Drive',120,100,1,1),
(6,'Webcam',500,30,1,1),
(7,'Printer',1200,20,3,3),
(8,'Desk Lamp',200,25,2,2),
(9,'Chair',850,12,2,2),
(10,'Table',1400,8,2,2),
(11,'Headphones',350,35,1,1),
(12,'Smartphone',6500,20,1,1),
(13,'Tablet',4200,18,1,1),
(14,'Router',400,50,1,1),
(15,'External HDD',950,22,1,1);


-- Sipariþler (20 adet)
INSERT INTO Siparis (id, musteri_id, tarih, toplam_tutar, odeme_turu) VALUES
(1,1,'2025-09-01',9150,'Kredi Kartý'),
(2,2,'2025-09-02',1200,'Nakit'),
(3,3,'2025-09-02',1800,'Kredi Kartý'),
(4,4,'2025-09-03',500,'Nakit'),
(5,5,'2025-09-04',4200,'Kredi Kartý'),
(6,6,'2025-09-04',950,'Nakit'),
(7,7,'2025-09-05',2500,'Kredi Kartý'),
(8,8,'2025-09-06',1350,'Nakit'),
(9,9,'2025-09-06',750,'Kredi Kartý'),
(10,10,'2025-09-07',1800,'Nakit'),
(11,11,'2025-09-08',500,'Kredi Kartý'),
(12,12,'2025-09-08',6500,'Nakit'),
(13,13,'2025-09-09',4200,'Kredi Kartý'),
(14,14,'2025-09-10',400,'Nakit'),
(15,15,'2025-09-10',850,'Kredi Kartý'),
(16,16,'2025-09-11',1200,'Nakit'),
(17,17,'2025-09-11',350,'Kredi Kartý'),
(18,18,'2025-09-12',1400,'Nakit'),
(19,19,'2025-09-13',950,'Kredi Kartý'),
(20,20,'2025-09-14',6500,'Nakit');

-- Sipariþ Detaylarý
INSERT INTO Siparis_Detay (id, siparis_id, urun_id, adet, fiyat) VALUES
(1,1,1,1,7500),
(2,1,2,1,1500),
(3,2,4,1,1200),
(4,3,4,1,1800),
(5,4,6,1,500),
(6,5,13,1,4200),
(7,6,15,1,950),
(8,7,3,1,2500),
(9,8,9,1,1350),
(10,9,2,5,750),
(11,10,4,1,1800),
(12,11,6,1,500),
(13,12,12,1,6500),
(14,13,13,1,4200),
(15,14,14,1,400),
(16,15,9,1,850),
(17,16,4,1,1200),
(18,17,11,1,350),
(19,18,10,1,1400),
(20,19,15,1,950);

--GÜNCELLEME

--Müþteri tablosunda id deðeri 1 olan müþterinin þehir bilgisini Ýzmir olarak güncellenmeli ise
UPDATE Musteri SET sehir='Ýzmir' WHERE id=1;

UPDATE Siparis_Detay SET adet= 2 WHERE id=1; --sordularda mantýklý sonuçlar çýkmasý için verileri güncelliyorum

UPDATE Siparis_Detay SET adet= 3 WHERE id=2;

UPDATE Siparis_Detay SET adet= 6 WHERE id=7;

UPDATE Siparis_Detay SET adet= 4 WHERE id=8;

UPDATE Siparis_Detay SET adet= 8 WHERE id=12;

UPDATE Siparis_Detay SET adet= 11 WHERE id=19;

UPDATE Siparis_Detay SET adet= 7 WHERE id=16;

--Sipariþ tablosunda id deðeri 20 olan sipariþi tablodan tamamen silinmeli ise
DELETE FROM Siparis WHERE id=20;

-- TRUNCATE TABLE Siparis;  Siparis tablosundaki tüm verileri siler, çalýþtýrma!

--VERÝ SORGULAMA VE RAPORLAMA

--En çok sipariþ veren 5 müþteri

 SELECT TOP 5
    Musteri.id,
    Musteri.ad,
    Musteri.soyad,
    SUM(Siparis_Detay.adet) AS Toplam_Urun_Adedi
FROM Musteri
JOIN Siparis ON Musteri.id = Siparis.musteri_id
JOIN Siparis_Detay ON Siparis.id = Siparis_Detay.siparis_id
GROUP BY Musteri.id, Musteri.ad, Musteri.soyad
ORDER BY SUM(Siparis_Detay.adet) DESC;

-- En çok satýlan ürünler

SELECT TOP 5
    Urun.ad AS Urun_Adi,
    SUM(Siparis_Detay.adet) AS Toplam_Satis_Adedi
FROM Urun
JOIN Siparis_Detay ON Urun.id = Siparis_Detay.urun_id
GROUP BY Urun.ad
ORDER BY SUM(Siparis_Detay.adet) DESC;

-- En yüksek cirosu olan satýcýlar

SELECT TOP 2
    Satici.ad AS Satici_Adi,
    SUM(Siparis_Detay.adet * Siparis_Detay.fiyat) AS Toplam_Ciro
FROM Satici
JOIN Urun ON Satici.id = Urun.satici_id
JOIN Siparis_Detay ON Urun.id = Siparis_Detay.urun_id
GROUP BY Satici.ad
ORDER BY SUM(Siparis_Detay.adet * Siparis_Detay.fiyat) DESC;

-- Þehirlere göre müþteri sayýsý

SELECT 
    sehir AS Sehir,
    COUNT(id) AS Musteri_Sayisi
FROM Musteri
GROUP BY sehir
ORDER BY COUNT(id) DESC;

-- Kategori bazlý toplam satýþlar


SELECT 
    Kategori.ad AS Kategori,
    ISNULL(SUM(Siparis_Detay.adet * Urun.fiyat), 0) AS Toplam_Satis
FROM Kategori
LEFT JOIN Urun ON Urun.kategori_id = Kategori.id --satýþý olmayan kategorileri görmek adýna
LEFT JOIN Siparis_Detay ON Urun.id = Siparis_Detay.urun_id
GROUP BY Kategori.ad
ORDER BY Toplam_Satis DESC;

-- Aylara göre sipariþ sayýsý

SELECT 
    SUM(CASE WHEN MONTH(tarih) = 1 THEN 1 ELSE 0 END) AS Ocak,
    SUM(CASE WHEN MONTH(tarih) = 2 THEN 1 ELSE 0 END) AS Subat,
    SUM(CASE WHEN MONTH(tarih) = 3 THEN 1 ELSE 0 END) AS Mart,
    SUM(CASE WHEN MONTH(tarih) = 4 THEN 1 ELSE 0 END) AS Nisan,
    SUM(CASE WHEN MONTH(tarih) = 5 THEN 1 ELSE 0 END) AS Mayis,
    SUM(CASE WHEN MONTH(tarih) = 6 THEN 1 ELSE 0 END) AS Haziran,
    SUM(CASE WHEN MONTH(tarih) = 7 THEN 1 ELSE 0 END) AS Temmuz,
    SUM(CASE WHEN MONTH(tarih) = 8 THEN 1 ELSE 0 END) AS Agustos,
    SUM(CASE WHEN MONTH(tarih) = 9 THEN 1 ELSE 0 END) AS Eylul,
    SUM(CASE WHEN MONTH(tarih) = 10 THEN 1 ELSE 0 END) AS Ekim,
    SUM(CASE WHEN MONTH(tarih) = 11 THEN 1 ELSE 0 END) AS Kasim,
    SUM(CASE WHEN MONTH(tarih) = 12 THEN 1 ELSE 0 END) AS Aralik
FROM Siparis
WHERE YEAR(tarih) = 2025;

--kodu çalýþtýrdýðýmda hazýr olarak aldýðým verinin tek bir yalnýz eylül ayýný içerdiðini fark ettiðim için verileri deðiþtirme kararý aldým
-- güncelleme

UPDATE Siparis SET tarih = '2025-01-05' WHERE id = 1;
UPDATE Siparis SET tarih = '2025-02-10' WHERE id = 2;
UPDATE Siparis SET tarih = '2025-03-15' WHERE id = 3;
UPDATE Siparis SET tarih = '2025-04-20' WHERE id = 4;
UPDATE Siparis SET tarih = '2025-05-25' WHERE id = 5;
UPDATE Siparis SET tarih = '2025-06-10' WHERE id = 6;
UPDATE Siparis SET tarih = '2025-07-12' WHERE id = 7;
UPDATE Siparis SET tarih = '2025-08-18' WHERE id = 8;
UPDATE Siparis SET tarih = '2025-09-05' WHERE id = 9;
UPDATE Siparis SET tarih = '2025-10-09' WHERE id = 10;
UPDATE Siparis SET tarih = '2025-11-15' WHERE id = 11;
UPDATE Siparis SET tarih = '2025-12-20' WHERE id = 12;
UPDATE Siparis SET tarih = '2025-01-22' WHERE id = 13;
UPDATE Siparis SET tarih = '2025-02-27' WHERE id = 14;
UPDATE Siparis SET tarih = '2025-03-30' WHERE id = 15;
UPDATE Siparis SET tarih = '2025-04-05' WHERE id = 16;
UPDATE Siparis SET tarih = '2025-05-10' WHERE id = 17;
UPDATE Siparis SET tarih = '2025-06-15' WHERE id = 18;
UPDATE Siparis SET tarih = '2025-07-20' WHERE id = 19;
UPDATE Siparis SET tarih = '2025-08-25' WHERE id = 20;

--Sipariþlerde müþteri bilgisi + ürün bilgisi + satýcý bilgisi.

SELECT 
    Siparis.id AS Siparis_ID,
    Musteri.ad + ' ' + Musteri.soyad AS Musteri_Adi,
    Musteri.email,
    Musteri.sehir,
    Urun.ad AS Urun_Adi,
    Siparis_Detay.adet AS Adet,
    Satici.ad AS Satici_Adi
FROM Siparis
JOIN Musteri ON Siparis.musteri_id = Musteri.id
JOIN Siparis_Detay ON Siparis.id = Siparis_Detay.siparis_id
JOIN Urun ON Siparis_Detay.urun_id = Urun.id
JOIN Satici ON Urun.satici_id = Satici.id
ORDER BY Siparis.id;

-- Hiç satýlmamýþ ürünler

SELECT 
    Urun.id AS Urun_ID,
    Urun.ad AS Urun_Adi,
    Urun.fiyat,
    Urun.stok
FROM Urun
LEFT JOIN Siparis_Detay ON Urun.id = Siparis_Detay.urun_id
WHERE Siparis_Detay.urun_id IS NULL;

-- Hiç sipariþ vermemiþ müþteriler

SELECT 
    Musteri.id AS Musteri_ID,
    Musteri.ad AS Ad,
    Musteri.soyad AS Soyad,
    Musteri.email,
    Musteri.sehir
FROM Musteri
LEFT JOIN Siparis ON Musteri.id = Siparis.musteri_id
WHERE Siparis.musteri_id IS NULL;

-- En çok kazanç saðlayan ilk 3 kategori

SELECT TOP 3
    Kategori.ad AS Kategori_Adi,
    SUM(Siparis_Detay.adet * Urun.fiyat) AS Toplam_Kazanc
FROM Siparis_Detay
JOIN Urun ON Siparis_Detay.urun_id = Urun.id
JOIN Kategori ON Urun.kategori_id = Kategori.id
GROUP BY Kategori.ad
ORDER BY Toplam_Kazanc DESC;

-- En az bir kez elektronik ürün satýn alan müþteriler

SELECT DISTINCT
    Musteri.id AS Musteri_ID,
    Musteri.ad AS Ad,
    Musteri.soyad AS Soyad,
    Musteri.email,
    Musteri.sehir
FROM Musteri
JOIN Siparis ON Musteri.id = Siparis.musteri_id
JOIN Siparis_Detay ON Siparis.id = Siparis_Detay.siparis_id
JOIN Urun ON Siparis_Detay.urun_id = Urun.id
JOIN Kategori ON Urun.kategori_id = Kategori.id
WHERE Kategori.ad = 'Elektronik Aletler';









    


