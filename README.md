🍔 QuickBite - Smart Canteen Management System

An Object-Oriented Programming (OOP) Minor Project designed to digitize campus canteen operations, eliminate ordering queues, enable real-time token tracking, and streamline kitchen inventory management.

📌 Table of Contents

Overview

Key Features

Student Portal

Staff Portal

System Architecture

OOP Concepts Applied

Tech Stack

Database Schema

Setup & Installation

Project Metadata & Team

📖 Overview

In traditional manual canteens, students waste significant break time in long queues to order food, with no clear visibility on preparation progress. On the administrative side, kitchen staff struggle to manage pending orders and keep track of item stocks manually.

QuickBite solves this problem by connecting students and kitchen staff through a unified desktop application built with Java Swing and MySQL. Students can view live stock availability, place cart-based pre-orders, receive unique order tokens (TKN-XXXX), and track their order status. Kitchen staff get a real-time pending queue dashboard, low-stock alerts, sales analytics, and automated status updates powered by Java Multithreading.

✨ Key Features

🎓 Student Portal

Student Registration: Simple account setup using Student ID and name.

Live Menu & Stock View: Real-time visibility of all food items, prices, and stock availability. Low-stock items ($\le 5$) are highlighted in orange, and out-of-stock items are visually marked.

Cart & Pre-Ordering: Pick multiple items, specify quantities, and view real-time subtotal/total price calculations.

Token Generation: Generates a unique token (e.g., TKN-4821) upon order placement.

Token Tracking & Alerts: Track token progress (Pending $\rightarrow$ Ready). A background thread triggers a visual and audio bell alert when food is prepared.

👨‍🍳 Staff Portal

Pending Orders Queue: Auto-refreshes every 5 seconds to display orders waiting in the kitchen.

Menu Setup & Stock Reset: One-click utility to reset inventory stock and load 10 default menu items into the database while clearing stale pending orders.

Sales Analytics & Visualization: Interactive dashboard displaying live order metrics (Total, Pending, Ready) and a custom bar chart for item stock levels.

🏗️ System Architecture

QuickBite follows a 3-Tier Architecture:

Presentation Layer (UI): Built using Java Swing (JFrame, JTable, CardLayout, custom Graphics2D rendered components).

Application Layer (Business Logic): Handles input validation, cart management, total price calculations, token generation, and thread dispatching.

Data Layer (Persistence): Manages persistent storage in a MySQL database connected via JDBC.

[ Swing GUI (Presentation) ] <---> [ Application Logic & Threads ] <---> [ JDBC Driver ] <---> [ MySQL Database ]


🧬 OOP Concepts Applied

As an Object-Oriented Programming project, QuickBite demonstrates key OOP pillars in its codebase:

OOP Pillar

Code Implementation

Inheritance

Custom UI components extend base Swing/Java classes (RoundedButton extends JButton, Card extends JPanel, OrderProcessor extends Thread).

Encapsulation

Model objects like CartLine and OrderProcessor use final private/protected fields initialized strictly via constructors.

Polymorphism

Overriding method behavior such as paintComponent(Graphics g) for custom UI graphics rendering and run() for background thread behavior.

Multithreading

The OrderProcessor background thread handles asynchronous order delay timers (40s) and status updates without freezing the main Swing UI thread.

🛠️ Tech Stack

Language: Java 17+

GUI Framework: Java Swing (javax.swing.*, java.awt.*)

Database: MySQL Server 8.0+

Database Connectivity: JDBC Driver (mysql-connector-j)

Data Collections: Java Collections API (ArrayList, List)

🗄️ Database Schema

The application connects to a MySQL database named quickbite_db.

CREATE DATABASE IF NOT EXISTS quickbite_db;
USE quickbite_db;

-- 1. Users Table
CREATE TABLE IF NOT EXISTS Users (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    role VARCHAR(20) DEFAULT 'Student'
);

-- 2. MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    itemId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    stock INT NOT NULL
);

-- 3. Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    orderId VARCHAR(20) PRIMARY KEY,
    userId VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (userId) REFERENCES Users(id)
);


🚀 Setup & Installation

Prerequisites

JDK 17 or higher installed.

MySQL Server installed and running on localhost:3306.

MySQL Connector/J JAR file added to your project build path.

Steps

Clone the repository:

git clone https://github.com/deepakas20/QUICKBITE.git
cd QUICKBITE


Configure Database Credentials:
Open Main.java and update the database URL, Username, and Password constants according to your local MySQL configuration:

static final String URL  = "jdbc:mysql://localhost:3306/quickbite_db";
static final String USER = "root";
static final String PASS = "your_mysql_password";


Compile and Run:

Open the project in your preferred Java IDE (IntelliJ IDEA, Eclipse, or VS Code).

Run Main.java.

First-Time Initialisation:

On the login screen, click Continue as Staff.

Navigate to ⚙️ Setup Menu & Stock and click ⚙️ Load default menu.

This automatically creates the tables, inserts default menu items, and populates stock levels!

👥 Project Metadata & Team

Course: Minor Project | Object Oriented Programming

Institution: Marian Engineering College

Date: October 2026

👨‍💻 Project Team

Deepak A S

Shavolin Suresh

Adharsh Raj B R

Aaron S

🎓 Project Guide

Ms. N Reshma Pillai (Department of Computer Science & Engineering)
