SELECT SUM(ct.Population)
FROM CITY ct, 
    COUNTRY co
WHERE ct.CountryCode = co.Code AND
    co.Continent = 'Asia'