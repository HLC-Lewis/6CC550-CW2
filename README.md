
# Beecham Family Application

The Beecham Family Software Application is a web-based platform designed to help the Beecham family manage tasks, events, and shared notes.
It provides a user interface for creating, viewing, and editing scheduled events. The software application has been created using Node.js, Express, and MariaDB, with Tailwind CSS for styling.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [File Structure](#file-structure)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Features

- User Authentication: Secure login using bcrypt for password hashing.
- Task Management: Create, view, and edit tasks, events, notes, notifications, reminders, and smart device entries.
- Responsive Design: User interface styled with Tailwind CSS for a responsive and modern look.
- RESTful API: API endpoints for managing tasks.

## Installation

To run the Beecham Family Application locally, follow these steps:

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

## Usage

### Login

Navigate to `http://localhost:3000/login.html` to access the login page. Enter your credentials to log in.

### Main Interface

After logging in, you will be directed to the main interface (`main.html`). Here, you can view the list of entries, create new entries, and manage existing ones.

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