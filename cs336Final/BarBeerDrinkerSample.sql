DROP DATABASE `BarBeerDrinkerSample`;
CREATE DATABASE  IF NOT EXISTS `BarBeerDrinkerSample` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `BarBeerDrinkerSample`;


CREATE TABLE `accounts` (
`userid` varchar(255) NOT NULL,
`password` varchar(255) NOT NULL,
`access` int NOT NULL,
PRIMARY KEY (`userid`)


) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `accounts`(`userid`, `password`, `access`) VALUES ('admin', 'mydb', '2');
INSERT INTO `accounts`(`userid`, `password`, `access`) VALUES ('a', 'a', '0');
INSERT INTO `accounts`(`userid`, `password`, `access`) VALUES ('b', 'b', '1');
INSERT INTO `accounts`(`userid`, `password`, `access`) VALUES ('c', 'c', '0');

CREATE TABLE Airline (
Id varchar(2) NOT NULL,
PRIMARY KEY (Id)
);
INSERT INTO Airline(Id) VALUES ("AA");
INSERT INTO Airline(Id) VALUES ("BB");
INSERT INTO Airline(Id) VALUES ("CC");
INSERT INTO Airline(Id) VALUES ("DD");
INSERT INTO Airline(Id) VALUES ("EE");
INSERT INTO Airline(Id) VALUES ("FF");
INSERT INTO Airline(Id) VALUES ("GG");
INSERT INTO Airline(Id) VALUES ("HH");

CREATE TABLE Airport (
Id varchar(3) NOT NULL,

PRIMARY KEY (Id)
);
INSERT INTO Airport(Id) VALUES ("AAA");
INSERT INTO Airport(Id) VALUES ("BBB");
INSERT INTO Airport(Id) VALUES ("CCC");
INSERT INTO Airport(Id) VALUES ("DDD");
INSERT INTO Airport(Id) VALUES ("EEE");
INSERT INTO Airport(Id) VALUES ("FFF");
INSERT INTO Airport(Id) VALUES ("GGG");
INSERT INTO Airport(Id) VALUES ("HHH");

CREATE TABLE Aircraft (
Id varchar(2) NOT NULL,
PRIMARY KEY (Id)
);

CREATE TABLE Flight (
FlightNumber int,
ArrivalTime DATETIME,
DepartureTime DATETIME NOT NULL,
dom_int varchar(30),
Fare int,
departingFrom varchar(3),
arrivingTo varchar(3),
airlineID varchar(2),
PRIMARY KEY (FlightNumber),
FOREIGN KEY (airlineID) REFERENCES `Airline`(Id),
FOREIGN KEY (departingFrom) REFERENCES `Airport`(Id),
FOREIGN KEY (arrivingTo) REFERENCES `Airport` (Id)
);
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("111",'2019-04-27 09:00:00', '2016-04-26 10:00:00', "dom", "25", "AAA","BBB", "AA");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("112",'2019-04-27 09:00:00', '2016-04-26 10:00:00', "dom", "25", "AAA","BBB", "AA");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("113",'2019-04-27 09:00:00', '2016-04-26 10:00:00', "dom", "25", "AAA","BBB", "AA");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("114",'2019-04-27 09:00:00', '2016-04-26 10:00:00', "dom", "25", "AAA","BBB", "AA");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("115",'2019-04-27 09:00:00', '2016-04-26 10:00:00', "dom", "25", "AAA","BBB","BB");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID ) VALUES ("222",'2019-04-20 09:00:00', '2016-04-18 14:00:00', "int", "22", "BBB","CCC", "BB");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("333",'2019-03-27 09:00:00', '2016-03-25 21:00:00', "dom", "100", "CCC","DDD", "CC");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("444",'2019-02-27 09:00:00', '2016-04-26 10:00:00', "int", "250", "DDD", "EEE", "DD");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("555",'2019-01-27 09:00:00', '2016-04-26 10:00:00', "int", "75", "EEE", "FFF", "EE");
INSERT INTO Flight(FlightNumber, ArrivalTime, DepartureTime, dom_int, Fare, departingFrom,   arrivingTo, airlineID) VALUES ("666",'2019-01-27 09:00:00', '2016-04-26 10:00:00', "dom", "60", "FFF", "AAA", "EE");

CREATE TABLE Reservation (
ReservationNumber int auto_increment,
FlightNumber int,
DateBooked DATETIME NOT NULL,
BookingFee int,
TotalFare int,
type varchar(50),
SpecialMeal varchar(30),
class varchar(50),
userid varchar(255),

PRIMARY KEY (ReservationNumber),
FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber)
); 
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("111", '2016-04-26 10:00:00', "50", "1000","one-way","chawal", "economy", "a");
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("222", '2016-04-18 14:00:00', "60", "1500","round-trip","chawal", "business", "a");
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("333", '2016-03-25 21:00:00', "69", "1559","round-tricp","roti", "first", "c");
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("333", '2016-03-25 21:00:00', "69", "1559","round-tricp","roti", "first", "c");
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("333", '2016-03-25 21:00:00', "69", "1559","round-tricp","roti", "first", "c");
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("333", '2016-03-25 21:00:00', "69", "1559","round-tricp","roti", "first", "c");
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("333", '2016-03-25 21:00:00', "69", "1559","round-tricp","roti", "first", "c");
INSERT INTO Reservation(FlightNumber, DateBooked, BookingFee, TotalFare, type, SpecialMeal, class, userid) VALUES ("333", '2016-03-25 21:00:00', "69", "1559","round-tricp","roti", "first", "c");

/*
CREATE TABLE Ticket (
Id int,
FlightNumber int,
ReservationNumber int,
SpecialMeal varchar(30),
class varchar(50),
userid varchar(50),
PRIMARY KEY (Id),
FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber),
FOREIGN KEY (ReservationNumber) REFERENCES Reservation(ReservationNumber),
FOREIGN KEY (userid) REFERENCES accounts(userid)
);
INSERT INTO Ticket(Id, FlightNumber, ReservationNumber, SpecialMeal, class) VALUES ('1212',"111","1111", "chawal", "business", "a");
INSERT INTO Ticket(Id, FlightNumber, ReservationNumber, SpecialMeal, class) VALUES ("1313","111","2222", "roti", "economy", "a");
INSERT INTO Ticket(Id, FlightNumber, ReservationNumber, SpecialMeal, class) VALUES ("1414","111","3333", "rotiKhao", "economyGaREEB", "a");


/*SELECT * FROM Ticket WHERE FlightNumber = "222";
SELECT userid, sum(BookingFee) bf FROM Reservation group by userid;