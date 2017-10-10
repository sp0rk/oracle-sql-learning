--Zad. 1. Znajdź imiona wrogów, którzy dopuścili się incydentów w 2009r.
SELECT 
    imie_wroga WROG,
    opis_incydentu PRZEWINA 
FROM Wrogowie_Kocurow WHERE
        EXTRACT (YEAR FROM data_incydentu) = 2009; 
    
--Zad. 2. Znajdź wszystkie kotki (płeć żeńska), które przystąpiły do stada między 1 września 2005r. a 31 lipca 2007r.
SELECT
    imie, funkcja, w_stadku_od "Z NAMI OD"
From Kocury WHERE
        plec = 'D'
    AND w_stadku_od BETWEEN '2005-09-01' AND '2007-07-31';