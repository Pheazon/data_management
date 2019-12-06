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



DROP TABLE IF EXISTS `Airport`;
CREATE TABLE `Airport` (
  `airport_id` VARCHAR(10),
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Airline`;
CREATE TABLE `Airline` (
 `airline_id` VARCHAR(10),
 `airport_id` VARCHAR(10),
  PRIMARY KEY(`airline_id`),
  FOREIGN KEY(`airport_id`) REFERENCES Airport(`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `IsAssociated` (
  `airport_id` VARCHAR(10),
  `airline_id` VARCHAR(10),
  PRIMARY KEY(`airport_id`, `airline_id`),
  FOREIGN KEY(`airport_id`) REFERENCES Airport(`airport_id`),
  FOREIGN KEY(`airline_id`) REFERENCES Airline(`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `Aircraft`;
CREATE TABLE `Aircraft` (
 `aircraft_id` VARCHAR(10),
 PRIMARY KEY(`aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `owns`;
CREATE TABLE `likes` (
  `aircraft_id` VARCHAR(10),
  `airline_id` VARCHAR(10),
  PRIMARY KEY(`aircraft_id`),
  FOREIGN KEY(`aircraft_id`) REFERENCES Aircraft(`aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS `OperatedBy`;
CREATE TABLE `OperatedBy` (
  `airline_id` VARCHAR(10),
  `flight_num` int,
  PRIMARY KEY(`flight_num`),
  FOREIGN KEY(`airline_id`) REFERENCES Airline(`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `Departure`;
CREATE TABLE `Departure` (
  `airport_id` VARCHAR(10),
  `flight_num` int,
  `depart_time` time,
  PRIMARY KEY(`flight_num`),
  FOREIGN KEY(`airport_id`) REFERENCES Airport(`airport_id`),
  FOREIGN KEY(`flight_num`) REFERENCES Flight(`flight_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Arrival`;
CREATE TABLE `Arrival` (
  `airport_id` VARCHAR(10),
  `flight_num` int,
  `arrive_time` time,
  PRIMARY KEY(`flight_num`),
  FOREIGN KEY(`airport_id`) REFERENCES Airport(`airline_id`),
  FOREIGN KEY(`flight_num`) REFERENCES Flight(`flight_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Ticket`;
CREATE TABLE `Ticket` (
  `ticket_num` int,
  `flight_num` int,
  `seat_num` VARCHAR(10),
  `isClass` boolean,
  `fare` float,
  `special_meal` VARCHAR(30),
  PRIMARY KEY(`ticket_num`),
  FOREIGN KEY(`flight_num`) REFERENCES Flight
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*INSERT INTO `Tickets`(`ticket_num`, `seat_num`, `isClass`, `fare`, `special_meal`) VALUES ('01', '555555555', '20', True, '22.50');*/



DROP TABLE IF EXISTS `Flight`;
CREATE TABLE `Flight` (
  `flight_num` int,
  `dom` int,
  `operational_day` int,
  PRIMARY KEY(`flight_num`, `airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `UsesAircraft`;
CREATE TABLE `UsesAircraft` (
  `flight_num` int,
  `aircraft_id` VARCHAR(10),
  `dom` int,
  `operational_day` int,
  PRIMARY KEY(`flight_num`),
  FOREIGN KEY(`flight_num`) REFERENCES Flight(`flight_num`),
  FOREIGN KEY(`aircraft_id`) REFERENCES Aircraft(`aircraft`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





DROP TABLE IF EXISTS `Flight_Operational`;
CREATE TABLE `Flight_Operational` (
  `flight_num` int,
  `operational_day` date,
  PRIMARY KEY(`flight_num`),
  FOREIGN KEY(`flight_num`) REFERENCES Flight(`flight_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





DROP TABLE IF EXISTS `Economy`;
CREATE TABLE `Economy` (
  `cancellation_fee` float,
  `ticket_num` int,
  PRIMARY KEY(`ticket_num`),
  FOREIGN KEY(`ticket_num`) REFERENCES Ticket(`ticket_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `customer_id` VARCHAR(10),
  `name` VARCHAR(50),
  PRIMARY KEY(`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Waitlist`;
CREATE TABLE `Waitlist` (
  `customer_id` VARCHAR(10),
  `flight_num` int,
  PRIMARY KEY(`customer_id`, `flight_num`),
  FOREIGN KEY(`customer_id`) REFERENCES Customer(`customer_id`),
  FOREIGN KEY(`flight_num`) REFERENCES Flight(`flight_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `Buys`;
CREATE TABLE `Buys` (
  `customer_id` VARCHAR(10),
  `ticket num` int,
  `purchase_date` date,
  PRIMARY KEY(`ticket_num`),
  FOREIGN KEY(`customer_id`) REFERENCES Customer(`customer_id`),
  FOREIGN KEY(`ticket_num`) REFERENCES Ticket(`ticket_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Reserves`;
CREATE TABLE `Reserves` (
  `customer_id` VARCHAR(10),
  `ticket_num` int,
  PRIMARY KEY(`ticket_num`),
  FOREIGN KEY(`customer_id`) REFERENCES Customer(`customer_id`),
  FOREIGN KEY(`ticket_num`) REFERENCES Ticket(`ticket_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `ssn` VARCHAR(10),
  `f_name` VARCHAR(30),
  `i_name` VARCHAR(30),
  `title` VARCHAR(30),
  `salary` float,
  PRIMARY KEY(`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Works_For`;
CREATE TABLE `Works_For` (
  `airline_id` VARCHAR(10),
  `ssn` VARCHAR(10),
  `since` date,
  PRIMARY KEY(`ssn`),
  FOREIGN KEY(`ssn`) REFERENCES Employee(`ssn`),
  FOREIGN KEY(`airline_id`) REFERENCES Airline(`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
