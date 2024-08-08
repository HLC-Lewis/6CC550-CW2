
# Beecham Family Application

This application is a web-based platform designed to help people manage tasks, events, and shared notes.

## Table of Contents

- [Installation](#installation)
- [Setting Up MariaDB](#setting-up-mariadb)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [File Structure](#file-structure)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Installation

To run locally, follow:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/HLC-Lewis/6CC550-CW2.git
   cd 6CC550-CW2
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Set up the database:**

   Ensure you have MariaDB installed and running. Update the database configuration in `server.js` and `create_users.js` files with your database credentials.

4. **Create initial users:**

   Run the script to create initial users:

   ```bash
   node create_users.js
   ```

5. **Start the server:**

   ```bash
   npm start
   ```

   The server runs at `http://localhost:3000`.


## Setting Up MariaDB

To set up MariaDB follow:

1. **Install MariaDB:**

   - **On Ubuntu:**
     ```bash
     sudo apt update
     sudo apt install mariadb-server
     ```

   - **On Windows:**
     Download the installer from the [MariaDB website](https://mariadb.org/download/) and follow the installation instructions.

2. **Secure the MariaDB installation:**
   ```bash
   sudo mysql_secure_installation
   ```

   Follow the prompts to set up the root password and remove anonymous users.

3. **Create a database and user for the application:**
   ```bash
   sudo mysql -u root -p
   CREATE DATABASE family_board;
   CREATE USER 'yourusername'@'localhost' IDENTIFIED BY 'yourpassword';
   GRANT ALL PRIVILEGES ON family_board.* TO 'yourusername'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   ```

4. **Import the database schema:**
   Ensure you have a SQL file (`schema.sql`) with the required database structure. Run the following command to import it:
   ```bash
   mysql -u yourusername -p family_board < path/to/schema.sql
   ```

5. **Update the database configuration in your application:**
   Modify the `server.js` and `create_users.js` files with your MariaDB credentials.

## Usage

### Login

Navigate to `http://localhost:3000/login.html` to access the login page. Enter your credentials to log in.

### Main Interface

After logging in, you will be directed to (`main.html`). Here, you can view the list of entries, create new entries, and manage existing ones.

## Endpoints

### User Authentication

- **POST** `/login`: Authenticate a user.

  Request Body:
  ```json
  {
    "email": "user@example.com",
    "password": "password"
  }
  ```

### Task Management

- **GET** `/tasks`: Retrieve all tasks.
- **POST** `/tasks`: Create a new task.

  Request Body:
  ```json
  {
    "type": "TASK",
    "title": "Sample Task",
    "details": "Task details",
    "created_by": "User"
  }
  ```

- **GET** `/tasks/:id`: Retrieve a specific task.
- **PUT** `/tasks/:id`: Update a specific task.

  Request Body:
  ```json
  {
    "type": "TASK",
    "title": "Updated Task",
    "details": "Updated details"
  }
  ```

## File Structure

- `server.js`: Main server file handling routes and database connections.
- `create_users.js`: Script for creating initial users in the database.
- `login.html`: Login page for user authentication.
- `main.html`: Main interface for managing tasks and other entries.
- `package.json`: Project metadata and dependencies.
- `package-lock.json`: Lockfile for dependencies.

## Dependencies

- **Express**: A minimal and flexible Node.js web application framework.
- **Body-parser**: Node.js body parsing middleware.
- **CORS**: A Node.js package for providing a Connect/Express middleware that can be used to enable CORS with various options.
- **MariaDB**: A robust, scalable, and reliable SQL database for developers.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## Development notes

This project/repo is for the purposes of a university project in which it is used to show agile working practices. This is an unsupported, unpolished and unfinished project.