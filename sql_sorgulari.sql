-- Türkiye Dış Ticaret Verisi Analizi (2021-2025)
-- Birim: Milyon ABD Doları

-- 1. Yıllara göre toplam ticaret özeti
-- Amacı: Her yıl için toplam ihracat, ithalat ve ticaret dengesini gösterir
SELECT
  yil AS Yil,
  ROUND(SUM(ihracat_usd) / 1000000, 2) AS Toplam_Ihracat_Milyon_USD,
  ROUND(SUM(ithalat_usd) / 1000000, 2) AS Toplam_Ithalat_Milyon_USD,
  ROUND(SUM(ticaret_dengesi) / 1000000, 2) AS Ticaret_Dengesi_Milyon_USD
FROM dis_ticaret
GROUP BY yil
ORDER BY yil;


-- 2. En çok ticaret yapılan 10 ülke
-- Amacı: Toplam ticaret hacmi en yüksek olan ilk 10 ülkeyi listeler
SELECT
  ulke AS Ulke,
  ROUND(SUM(ihracat_usd) / 1000000, 2) AS Ihracat_Milyon_USD,
  ROUND(SUM(ithalat_usd) / 1000000, 2) AS Ithalat_Milyon_USD,
  ROUND((SUM(ihracat_usd) + SUM(ithalat_usd)) / 1000000, 2) AS Toplam_Hacim_Milyon_USD
FROM dis_ticaret
GROUP BY ulke
ORDER BY Toplam_Hacim_Milyon_USD DESC
LIMIT 10;


-- 3. En çok ihraç edilen 5 ürün grubu
-- Amacı: En yüksek ihracat değerine sahip ilk 5 ürün grubunu gösterir
SELECT
  urun_grubu AS Urun_Grubu,
  ROUND(SUM(ihracat_usd) / 1000000, 2) AS Toplam_Ihracat_Milyon_USD
FROM dis_ticaret
GROUP BY urun_grubu
ORDER BY Toplam_Ihracat_Milyon_USD DESC
LIMIT 5;