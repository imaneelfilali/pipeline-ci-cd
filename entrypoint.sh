#!/bin/sh
# create a db and a table:
echo "Initializing database..."
mysql -u root -pmysql <<-EOSQL
CREATE DATABASE IF NOT EXISTS springboot_db;
USE springboot_db;
CREATE TABLE IF NOT EXISTS student (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT NOT NULL
);
EOSQL
echo "Database initialized."