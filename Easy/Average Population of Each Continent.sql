SELECT co.Continent,
    FLOOR(AVG(ct.population))
FROM CITY ct, 
    COUNTRY co
WHERE ct.CountryCode = co.Code
GROUP BY co.Continent
