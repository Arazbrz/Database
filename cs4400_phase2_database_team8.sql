-- CS4400: Introduction to Database Systems (Summer 2022)
-- Phase II: Create Table & Insert Statements [v0] Sunday, June 23, 2022 @ 1:04am EDT
-- Team 8
-- Akash Narayanan anarayanan64
-- Yoon Ku Kang ykang60
-- Aman Patel apatel734
-- Team Member Name (GT username)
-- Directions:
-- Please follow all instructions for Phase II as listed on Canvas.
-- Fill in the team number and names and GT usernames for all members above.
-- Create Table statements must be manually written, not taken from an SQL Dump 
-- file.
-- This file must run without error for credit.
-- ------------------------------------------------------
-- CREATE TABLE STATEMENTS AND INSERT STATEMENTS BELOW

DROP DATABASE IF EXISTS phaseII;
CREATE DATABASE IF NOT EXISTS phaseII;
USE phaseII;

CREATE TABLE Team( 
    ID varchar(255) NOT NULL,
    country varchar(255),
    team_name varchar(255),
    captain varchar(255),
	PRIMARY KEY (ID),
	LeadPlayerID varchar(255)
);

CREATE TABLE Club(
	ClubID varchar(255),
    country_rank int
);

CREATE TABLE Nation(
	NationID varchar(255),
	world_rank int
);

CREATE TABLE Worker(
	WID varchar(255) NOT NULL,
    PRIMARY KEY (WID),
    lname varchar(255),
    fname varchar(255),
    estimated_salary int,
    country varchar(255),
    entered_year int,
    EmployerClubID varchar(255)
);

CREATE TABLE Coach(
	CoachID varchar(255),
    PRIMARY KEY (CoachID),
    num_years int,
    license_id varchar(255)
);

CREATE TABLE Player(
	PlayerID varchar(255),
    PRIMARY KEY (PlayerID),
    num_assists int,
    num_goals int,
    birthday date,
    position varchar(255),
    jersey_number int,
    NationTeamID varchar(255)
);

CREATE TABLE Company(
	CompanyID varchar(255) NOT NULL,
    PRIMARY KEY (CompanyID),
    company_name varchar(255),
    address varchar(255),
    EndorsedPlayerID varchar(255)
);

CREATE TABLE Competition(
	CompID varchar(255) NOT NULL,
    PRIMARY KEY (CompID),
    comp_type varchar(255),
    comp_year int(255),
    comp_event varchar(255)
);

CREATE TABLE Sponsor(
	ComID varchar(255),
    CoID varchar(255)
);

CREATE TABLE Participate(
	ComID varchar(255),
    TeamID varchar(255)
);

CREATE TABLE ItemOrder(
	CID varchar(255),
    WorkerID varchar(255),
    OrderNumber int NOT NULL,
    PRIMARY KEY (OrderNumber),
    item_name varchar(255),
    num_item int,
    price_item int
);

ALTER TABLE Team
    ADD FOREIGN KEY (LeadPlayerID) REFERENCES Player(PlayerID);

ALTER TABLE Club
	ADD FOREIGN KEY (ClubID) REFERENCES Team(ID);
    
ALTER TABLE Nation
	ADD FOREIGN KEY (NationID) REFERENCES Team(ID);
    
ALTER TABLE Worker
	ADD FOREIGN KEY (EmployerClubID) REFERENCES Club(ClubID);
    
ALTER TABLE Coach
	ADD FOREIGN KEY (CoachID) REFERENCES Worker(WID);
    
ALTER TABLE Player
	ADD FOREIGN KEY (PlayerID) REFERENCES Worker(WID),
    ADD FOREIGN KEY (NationTeamID) REFERENCES Nation(NationID);

ALTER TABLE Company
	ADD FOREIGN KEY (EndorsedPlayerID) REFERENCES Player(PlayerID);
    
ALTER TABLE Sponsor
	ADD FOREIGN KEY (ComID) REFERENCES Competition(CompID),
    ADD FOREIGN KEY (CoID) REFERENCES Company(CompanyID);
    
ALTER TABLE Participate
	ADD FOREIGN KEY (ComID) REFERENCES Competition(CompID),
	ADD FOREIGN KEY (TeamID) REFERENCES Team(ID);
    
ALTER TABLE ItemOrder
	ADD FOREIGN KEY (CID) REFERENCES Club(ClubID),
    ADD FOREIGN KEY (WorkerID) REFERENCES Worker(WID);


INSERT INTO Team(ID, country, team_name, captain) 
    VALUES ("RMD", "Spain", "Real Madrid CF", "Karim Benzema");

INSERT INTO Club(ClubID, country_rank)
    VALUES("RMD", 1);

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("CA130", "Ancelotti", "Carlo", 355, "Italy", 2021, "RMD");

INSERT INTO Coach(CoachID, license_id)
    VALUES("CA130", "303-600-411"); 

INSERT INTO Team(ID, country, team_name, captain) 
    VALUES("MCF", "United Kingdom", "Manchester City F.C.", "Fernando Luiz Roza");

INSERT INTO Club(ClubID, country_rank)
    VALUES("MCF", 1);

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("PG140", "Guardiola", "Pep", 385, "Spain", 2016, "MCF");

INSERT INTO Coach(CoachID, license_id)
    VALUES("PG140", "303-549-882");

INSERT INTO Team(ID, country, team_name, captain) 
    VALUES("BEL", "Belgium", "Belgium National Football Team", "Eden Hazard");

INSERT INTO Nation(NationID, world_rank)
    VALUES("BEL", 2);

INSERT INTO Team(ID, country, team_name, captain) 
    VALUES("CRO", "Croatia", "Croatia National Football Team", "Luka Modric");

INSERT INTO Nation(NationID, world_rank)
    VALUES("CRO", 15);

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("LM360", "Modric", "Luka", 325, "Croatia", 2012, "RMD");

INSERT INTO Player(PlayerID, num_assists, num_goals, birthday, position, jersey_number, NationTeamID)
    VALUES("LM360", 12, 2, '1985-09-09', "Midfielder", 10, NULL); 

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("TC361", "Courtois", "Thibaut", 300, "Belgium", 2018, "RMD");

INSERT INTO Player(PlayerID, num_assists, num_goals, birthday, position, jersey_number, NationTeamID)
    VALUES("TC361", 0, 0, '1992-05-11', "Goal-keeper", 1, NULL); 

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("KB367", "Benzema", "Karim", 276, "France", 2009, "RMD");

-- Benzema represents national team but there is no data for national French team
INSERT INTO Player(PlayerID, num_assists, num_goals, birthday, position, jersey_number, NationTeamID)
    VALUES("KB367", 12, 27, '1987-12-19', "Forward", 9, NULL); 

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("KD415", "De Bruyne", "Kevin", 390, "Belgium", 2015, "MCF");

INSERT INTO Player(PlayerID, num_assists, num_goals, birthday, position, jersey_number, NationTeamID)
    VALUES("KD415", 8, 15, '1991-06-28', "Midfielder", 17, NULL); 

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("EH370", "Hazard", "Eden", 430, "Belgium", 2019, "RMD");

INSERT INTO Player(PlayerID, num_assists, num_goals, birthday, position, jersey_number, NationTeamID)
    VALUES("EH370", 1, 2, '1991-01-07', "Forward", 7, NULL);

INSERT INTO Worker(WID, lname, fname, estimated_salary, country, entered_year, EmployerClubID)
    VALUES("AP407", "Palaversa", "Ante", 18, "Croatia", 2019, "MCF");

INSERT INTO Player(PlayerID, num_assists, num_goals, birthday, position, jersey_number, NationTeamID)
    VALUES("AP407", 4, 2, '2000-04-06', "Midfielder", 8, NULL);

INSERT INTO Company(CompanyID, company_name, address, EndorsedPlayerID)
    VALUES("NK02", "Nike", "One Bowerman Dr, Beaverton, OR 97005, United States", "TC361");

INSERT INTO Company(CompanyID, company_name, address, EndorsedPlayerID)
    VALUES("CC03", "Coca-Cola", "1 Coca Cola Plz NW, Atlanta, GA 30313, United States", "EH370");

INSERT INTO Competition(CompID, comp_type, comp_year, comp_event)
    VALUES("wc_18", "National game", 2018, "World Cup");

INSERT INTO Participate(ComID, TeamID)
    VALUES("wc_18", "BEL");

INSERT INTO Participate(ComID, TeamID)
    VALUES("wc_18", "CRO");

INSERT INTO Sponsor(ComID, CoID)
    VALUES("wc_18", "CC03");

INSERT INTO Sponsor(ComID, CoID)
    VALUES("wc_18", "NK02");

INSERT INTO Competition(CompID, comp_type, comp_year, comp_event)
    VALUES("ec_21", "Club game", 2021, "UEFA European Championship");

INSERT INTO Participate(ComID, TeamID)
    VALUES("ec_21", "RMD");

INSERT INTO Participate(ComID, TeamID)
    VALUES("ec_21", "MCF");

INSERT INTO Sponsor(ComID, CoID)
    VALUES("ec_21", "NK02");

INSERT INTO ItemOrder(CID, WorkerID, OrderNumber, item_name, num_item, price_item)
    VALUES("RMD", "CA130", 2316, "Football", 30, 100);

INSERT INTO ItemOrder(CID, WorkerID, OrderNumber, item_name, num_item, price_item)
    VALUES("RMD", "CA130", 4400, "Training poles", 2, 300);
