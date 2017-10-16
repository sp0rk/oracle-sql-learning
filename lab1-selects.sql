ALTER SESSION SET NLS_DATE_FORMAT='yyyy-mm-dd';


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
    
--Zad. 3. Wyświetl imiona, gatunki i stopnie wrogości nieprzekupnych wrogów. Wyniki mają być uporządkowane rosnąco według stopnia wrogości.
SELECT imie_wroga "WROG", gatunek, stopien_wrogosci
FROM Wrogowie WHERE 
        lapowka IS NUll
ORDER BY stopien_wrogosci;

--Zad. 4. Wyświetlić dane o kotach płci męskiej zebrane w jednej kolumnie postaci:
--JACEK zwany PLACEK (fun. LOWCZY) lowi myszki w bandzie2 od 2008-12-01
--Wyniki należy uporządkować malejąco wg daty przystąpienia do stada. W przypadku tej samej daty przystąpienia wyniki uporządkować alfabetycznie wg  pseudonimów.
SELECT imie || ' zwany ' || pseudo || ' (fun. ' || funkcja || ') lowi myszki w bandzie ' 
        || nr_bandy || ' od ' || w_stadku_od
FROM Kocury WHERE
        plec = 'M'
ORDER BY w_stadku_od DESC, pseudo;

--Zad. 5. Znaleźć pierwsze wystąpienie litery A i pierwsze wystąpienie litery L w każdym pseudonimie a następnie zamienić znalezione litery na odpowiednio # i %. Wykorzystać funkcje działające na łańcuch--ach. Brać pod uwagę tylko te imiona, w których występują obie litery.
SELECT pseudo, 
    REGEXP_REPLACE(REGEXP_REPLACE(pseudo, 'A', '#', 1, 1), 'L', '%', 1, 1)
        "Po wymianie A na # oraz L na %"
FROM Kocury WHERE
        pseudo LIKE '%A%L%' OR pseudo LIKE '%L%A%';
        
--Zad. 6. Wyświetlić imiona kotów z co najmniej ośmioletnim stażem (które dodatkowo przystępowały do stada od 1 marca do 30 września), daty ich przystąpienia do stada, początkowy przydział myszy (obecny przydział, ze względu na podwyżkę po pół roku członkostwa,  jest o 10% wyższy od początkowego) , datę wspomnianej podwyżki o 10% oraz aktualnym przydział myszy. Wykorzystać odpowiednie funkcje działające na datach. W poniższym rozwiązaniu datą bieżącą jest 11.07.2017
