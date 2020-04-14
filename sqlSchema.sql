create database cs336project;
use cs336project;

DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
user_name varchar(25) NOT NULL,
password1 varchar(25) NOT NULL, 
email varchar(64) NOT NULL
);

CREATE TABLE flights (
airline_id varchar(2) NOT NULL,
flight_num INT NOT NULL,
stops varchar(50) NOT NULL,
fares INT NOT NULL,
num_seats INT NOT NULL,
working_days varchar(50),
depart_time time NOT NULL,
depart_aid varchar(2) NOT NULL,
arrive_time time NOT NULL,
arrive_aid varchar(2) NOT NULL,
foreign key(depart_aid) references airports(Airport_id),
foreign key(arrive_aid) references airports(Airport_id),
foreign key(airline_id)references airlines (Airline_id),
primary key (flight_num, airline_id)
);
CREATE TABLE airlines (
Airline_id varchar(2) NOT NULL,
a_name varchar(25) NOT NULL,
primary key(Airline_id)
);

CREATE TABLE airports (
Airport_id varchar(3) NOT NULL,
ap_name varchar(25) NOT NULL,
city varchar(25) NOT NULL,
country varchar(25) NOT NULL,
primary key(Airport_id));

CREATE TABLE reservations(
res_number int NOT NULL,
booking_fee int NOT NULL,
passengers int NOT NULL,
cust_rep varchar(25),
total_fare int NOT NULL,
date_ date,
fare_rest varchar(25) NOT NULL,
primary key (res_number)
);

CREATE TABLE operates(
Airline_id varchar(2) NOT NULL,
flight_num int,
primary key (Airline_id, flight_num),
foreign key(flight_num) references flights(flight_num),
foreign key(Airline_id) references airlines(Airline_id)
);

