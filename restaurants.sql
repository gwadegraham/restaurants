**Author: Garrett Graham
**Email: gwgraham@uark.edu


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

    //second insert
    INSERT INTO Restaurant (restaurantID, restaurantName, type, city)
    VALUES ('3', 'Eureka Pizza', 'Pizza', 'Fayetteville');

    //third insert
    INSERT INTO Restaurant (restaurantID, restaurantName, type, city)
    VALUES ('5', 'Tasty Thai', 'Asian', 'Las Vegas');

//Dish Table Inserts
    //first insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('13', 'Spring Rolls', 'ap');

    //second insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('15', 'Pad Thai', 'en');

    //third insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('16', 'Pot Stickers', 'ap');

    //fourth insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('22', 'Masaman Curry', 'en');

    //fifth insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('10', 'Custard', 'ds');

    //sixth insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('12', 'Garlic Bread', 'ap');

    //seventh insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('44', 'Salad', 'ap');

    //eighth insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('07', 'Cheese Pizza', 'en');

    //ninth insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('19', 'Pepperoni Pizza', 'en');

    //tenth insert
    INSERT INTO Dish (dishNo, dishname, type)
    VALUES ('77', 'Veggie Supreme Pizza', 'en');

//MenuItem Table Inserts
    //first insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('0', '0', '13', '8.00');

    //second insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('1', '0', '16', '9.00');

    //third insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('2', '0', '44', '10.00');

    //fourth insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('3', '0', '15', '19.00');

    //fifth insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('4', '0', '22', '19.00');

    //sixth insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('5', '3', '44', '6.25');

    //seventh insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('6', '3', '12', '5.50');

    //eighth insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('7', '3', '07', '12.50');

    //ninth insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('8', '3', '19', '13.50');

    //tenth insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('9', '5', '13', '6.00');

    //eleventh insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('10', '5', '15', '15.00');

    //twelfth insert
    INSERT INTO MenuItem (itemNo, restaurantNo, dishNo, price)
    VALUES ('11', '5', '22', '14.00');
