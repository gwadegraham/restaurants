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
ts TIME NOT NULL);

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

//FoodOrder Table Inserts
    //first insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('0', '2', '2017-03-01', '10:30');

    //second insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('1', '0', '2017-03-02', '15:33');

    //third insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('2', '3', '2017-03-01', '15:35');

    //fourth insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('3', '5', '2017-03-03', '21:00');

    //fifth insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('4', '7', '2017-03-01', '18:11');

    //sixth insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('5', '7', '2017-03-04', '18:51');

    //seventh insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('6', '9', '2017-03-01', '19:00');

    //eighth insert
    INSERT INTO FoodOrder (orderNo, itemNo, dt, ts)
    VALUES ('7', '11', '2017-03-05', '17:15');

//Queries (ones that I have to create):


    //query six
    SELECT Restaurant.restaurantName, Restaurant.city
    FROM Restaurant, MenuItem
    WHERE MenuItem.dishNo = '44' AND MenuItem.restaurantNo = Restaurant.restaurantID;

    //query seven
    SELECT DISTINCT Restaurant.restaurantName, Dish.dishName, MenuItem.price
    FROM Dish, MenuItem, Restaurant
    WHERE MenuItem.restaurantNo IN ('0', '5') AND Dish.dishNo = MenuItem.dishNo
          AND MenuItem.restaurantNo = Restaurant.restaurantID
    ORDER BY MenuItem.price ASC;

    //query eight
    SELECT DISTINCT Restaurant.restaurantName, Restaurant.city,
                    COUNT(DISTINCT MenuItem.dishNo) AS MenuItems,
                    ROUND(AVG(MenuItem.price), 2) AS AveragePrice
    FROM Restaurant, MenuItem, Dish
    WHERE Restaurant.restaurantID = MenuItem.restaurantNo AND MenuItem.dishNo = Dish.dishNo
          AND MenuItem.dishNo = Dish.dishNo
    GROUP BY Restaurant.restaurantID;

    //query nine
    SELECT Restaurant.restaurantName, COUNT(FoodOrder.itemNo) AS TotalOrders,
           ROUND(AVG(MenuItem.price), 2) AS AverageBasePrice,
           SUM(MenuItem.price) AS TotalBasePrice,
           1.1 * SUM(MenuItem.price) AS TotalWithTax
    FROM Restaurant, FoodOrder, MenuItem
    WHERE restaurantID = '3' AND FoodOrder.itemNo = MenuItem.itemNo
          AND MenuItem.restaurantNo = '3';

    //query ten
    SELECT COUNT(FoodOrder.itemNo) AS TotalOrders,
           ROUND(AVG(MenuItem.price), 2) AS AverageBasePrice,
           SUM(MenuItem.price) AS TotalBasePrice,
           1.1 * SUM(MenuItem.price) AS TotalWithTax
    FROM FoodOrder, MenuItem
    WHERE FoodOrder.itemNo = MenuItem.itemNo;
