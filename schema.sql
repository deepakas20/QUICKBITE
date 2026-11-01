-- QuickBite Database Schema
CREATE DATABASE IF NOT EXISTS quickbite_db;
USE quickbite_db;

CREATE TABLE Users (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(20)
);

CREATE TABLE MenuItems (
    itemId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    price DOUBLE,
    stock INT
);

CREATE TABLE Orders (
    orderId VARCHAR(20) PRIMARY KEY,
    userId VARCHAR(20),
    status VARCHAR(20)
);
