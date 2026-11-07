
# Hyderabad Tourism Web Application

A Java-based web application that helps users explore tourist destinations in Hyderabad and share their recommendations.

## About the Project

The Hyderabad Tourism Web Application provides a simple platform to browse tourist attractions, register an account, log in, and manage tourism spot information.

## Features

- User registration and login
- Session-based authentication
- Browse tourist destinations
- Add and manage tourism spot information
- MySQL database integration

## Technologies Used

- **Backend:** Java, Java Servlets, JSP
- **Frontend:** HTML, CSS, JavaScript
- **Database:** MySQL
- **Server:** Apache Tomcat 9
- **IDE:** Eclipse
- **JDBC:** MySQL Connector/J

## Project Structure

```text
HyderabadTourism/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/tourism/
│       │       ├── servlet/
│       │       └── util/
│       └── webapp/
│           ├── WEB-INF/
│           ├── index.jsp
│           ├── login.jsp
│           ├── register.jsp
│           ├── spots.jsp
│           └── logout.jsp
└── .gitignore
```

## Setup and Installation

1. Install JDK, Eclipse, Apache Tomcat 9, and MySQL.
2. Clone or download this repository.
3. Create a MySQL database named `hyderabad_tourism`.
4. Create the required `users` and tourism spots tables.
5. Configure your database connection locally. Keep database credentials outside the public repository.
6. Import the project into Eclipse as a Dynamic Web Project.
7. Configure Tomcat 9 in Eclipse.
8. Run the project on the server.

## Security Note

Database credentials are not included in this repository. Configure your own local database settings before running the application.

## Author

Vasavi Pagolu

