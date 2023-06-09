USE customer;

# Create tabel Demographic ,Product,Promotion,Place.
DROP TABLE IF EXISTS Demographic;
CREATE TABLE Demographic (
  id INT,
  age INT,
  eduction VARCHAR(255),
  marital_status VARCHAR(255),
  income INT,
  kidhome INT,
  teenhome INT,
  dt_customer VARCHAR(255),
  recency INT,
  complain INT
);
INSERT INTO Demographic
SELECT ID,(2023-Year_Birth) ,Education,Marital_Status,Income,Kidhome,Teenhome,Dt_Customer,Recency,Complain FROM marketing;

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
  id INT,
  wine INT,
  fruit INT,
  meat INT,
  fish INT,
  sweet INT,
  gold INT
);
INSERT INTO Product
SELECT ID,MntWines,MntFruits,MntMeatProducts,MntFishProducts,MntSweetProducts,MntGoldProds FROM marketing;

DROP TABLE IF EXISTS Promotion;
CREATE TABLE Promotion (
  id INT,
  num_deals_purchases INT,
  accepted_cmp1 INT,
  accepted_cmp2 INT,
  accepted_cmp3 INT,
  accepted_cmp4 INT,
  accepted_cmp5 INT,
  response INT
);
INSERT INTO Promotion
SELECT ID,NumDealsPurchases,AcceptedCmp1,AcceptedCmp2,AcceptedCmp3,AcceptedCmp4,AcceptedCmp5,Response FROM marketing;

DROP TABLE IF EXISTS Place;
CREATE TABLE Place (
  id INT,
  web_purchase INT,
  catalogue_purchase INT,
  store_purchase INT,
  web_visit INT
);
INSERT INTO Place
SELECT ID,NumWebPurchases,NumCatalogPurchases,NumStorePurchases,NumWebVisitsMonth FROM marketing;

SELECT * FROM marketing
LIMIT 5;

# What is the marital status that has the highest number of complaints?
SELECT marital_status, SUM(complain)
FROM demographic
GROUP BY marital_status
ORDER BY SUM(complain) DESC;

# Which type of product is preferred by individuals with different marital statuses when making a purchase?
SELECT d.marital_status,SUM(p.wine) ,SUM(p.fruit),SUM(p.meat),SUM(p.fish),SUM(p.sweet),SUM(p.gold)  FROM demographic d
JOIN Product P
ON d.id = p.id
GROUP BY d.marital_status





