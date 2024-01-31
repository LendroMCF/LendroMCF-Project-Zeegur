CREATE DATABASE Zeeg_db
USE Zeeg_db;

CREATE TABLE Account (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    CreationTime DATETIME,
    UpdateTime DATETIME,
    Email NVARCHAR(320),
    LegalId NVARCHAR(50),
    Phone NVARCHAR(15),
    Password NVARCHAR(255),
    Status NVARCHAR(50),
    Profile NVARCHAR(50)
);

CREATE TABLE AccountDetails (
    Id UNIQUEIDENTIFIER PRIMARY KEY REFERENCES Account(Id),
    CreationTime DATETIME,
    UpdateTime DATETIME,
    Name NVARCHAR(50),
    LastName NVARCHAR(50),
    BirthDate DATETIME
);

CREATE TABLE Wallet (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    CreationTime DATETIME,
    UpdateTime DATETIME,
    AccountId UNIQUEIDENTIFIER REFERENCES Account(Id),
    Amount DECIMAL(18, 2),
    Currency NVARCHAR(50)
);

CREATE TABLE Plans (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    CreationTime DATETIME,
    UpdateTime DATETIME,
    Name NVARCHAR(50),
    Description NVARCHAR(255),
    Value DECIMAL(18, 2),
    Status NVARCHAR(50)
);

CREATE TABLE AccountPlans (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    CreationTime DATETIME,
    UpdateTime DATETIME,
    AccountId UNIQUEIDENTIFIER REFERENCES Account(Id),
    PlanId UNIQUEIDENTIFIER REFERENCES Plans(Id),
    PaymentMethod NVARCHAR(50),
    LastPayment DATETIME,
    NextPayment DATETIME,
    MaxGroupes INT,
    MaxUsers INT
);

CREATE TABLE Groupe (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    CreationTime DATETIME,
    UpdateTime DATETIME,
    Name NVARCHAR(50),
    Description NVARCHAR(255),
    Icon NVARCHAR(50),
    MembersCount INT
);

CREATE TABLE AccountGroupe (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    CreationTime DATETIME,
    UpdateTime DATETIME,
    AccountId UNIQUEIDENTIFIER REFERENCES Account(Id),
    GroupeId UNIQUEIDENTIFIER REFERENCES Groupe(Id),
    MainCode NVARCHAR(50),
    DynamicCode NVARCHAR(50)
);

CREATE TABLE Report (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    CreationTime DATETIME,
    UpdateTime DATETIME,
    AccountId UNIQUEIDENTIFIER REFERENCES Account(Id),
    Title NVARCHAR(50),
    Description NVARCHAR(255)
);