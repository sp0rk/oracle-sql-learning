ALTER SESSION SET NLS_DATE_FORMAT='yyyy-mm-dd';

SELECT
    K.pseudo "POLUJE W POLU",
    K.przydzial_myszy "PRZYDZIAL MYSZY",
    B.nazwa
FROM
    Kocury K, Bandy B
WHERE
        K.nr_bandy = B.nr_bandy 
    AND K.przydzial_myszy > 50
    AND B.teren IN ('POLE', 'CALOSC');
    
SELECT 
    K.imie,
    K.w_stadku_od "POLUJE OD"
FROM
    Kocury K1, Kocury K
WHERE
    K1.imie = 'JACEK'
    AND K1.w_stadku_od > K.w_stadku_od
ORDER BY
    K.w_stadku_od DESC;
    
SELECT
    K1.imie "Imie",
    K1.funkcja "Funkcja",
    NVL(K2.imie,' ') "Szef 1",
    NVL(K3.imie,' ') "Szef 2",
    NVL(K4.imie,' ') "Szef 3"
FROM 
    Kocury K1 LEFT JOIN Kocury K2 ON K1.szef = k2.pseudo
        LEFT JOIN Kocury K3 ON K2.szef = K3.pseudo 
            LEFT JOIN Kocury K4 ON K3.szef = K4.pseudo
WHERE K1.funkcja IN ('KOT', 'MILUSIA');

SELECT 
    K.imie "Imie kotki",
    B.nazwa "Nazwa bandy",
    W.imie_wroga "Imie wroga",
    W.stopien_wrogosci "Ocena wroga",
    WK.data_incydentu "Data inc."
FROM
    Kocury K LEFT JOIN Bandy B ON K.nr_bandy = B.nr_bandy
    LEFT JOIN Wrogowie_Kocurow WK ON K.pseudo = WK.pseudo
    LEFT JOIN Wrogowie W ON W.imie_wroga = WK.imie_wroga
WHERE
        K.plec = 'D'
    AND WK.data_incydentu > '2007-01-01';