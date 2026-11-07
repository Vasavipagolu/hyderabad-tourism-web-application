CREATE DATABASE IF NOT EXISTS hyderabad_tourism;

USE hyderabad_tourism;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS tourist_spots (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(200) DEFAULT NULL,
    added_by VARCHAR(50) DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY added_by (added_by),
    CONSTRAINT tourist_spots_ibfk_1
        FOREIGN KEY (added_by) REFERENCES users (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;