//Creating Restaurant Table
CREATE TABLE Restaurant(
restaurantID INTEGER PRIMARY KEY,
restaurantName CHAR(15) NOT NULL,
type CHAR(15) NOT NULL,
city CHAR(15) NOT NULL);

//Creating Dish Table
CREATE TABLE Dish(
dishNo INTEGER PRIMARY KEY,
dishname CHAR(15) NOT NULL,
type ENUM('ap', 'en', 'ds'));

//Creating MenuItem Table
CREATE TABLE MenuItem(
itemNo INTEGER PRIMARY KEY,
restaurantNo INTEGER, dishNo INTEGER,
FOREIGN KEY (restaurantNo) REFERENCES Restaurant (restaurantID) ON DELETE RESTRICT,
FOREIGN KEY (dishNo) REFERENCES Dish (dishNo) ON DELETE SET NULL,
price DECIMAL(4,2) CHECK (price in (price<= 50.00 and price>=5.00)));

//Creating FoodOrder Table
CREATE TABLE FoodOrder(
orderNo INTEGER PRIMARY KEY,
itemNo INTEGER,
FOREIGN KEY (itemNo) REFERENCES MenuItem (itemNo) ON DELETE CASCADE,
dt DATE CHECK (date BETWEEN 2017-01-01 AND dateTo),
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

//Restaurant Table Inserts
    //first insert
    INSERT INTO Restaurant (restaurantID, restaurantName, type, city)
    VALUES ('0', 'Tasty Thai', 'Asian', 'Dallas');
