const mariadb = require('mariadb');
const bcrypt = require('bcrypt');
const crypto = require('crypto');

const pool = mariadb.createPool({
    host: '127.0.0.1',
    user: '',
    password: '',
    database: 'family_board',
    connectionLimit: 5
});

// Generate a random password
function generateRandomPassword(length = 12) {
    return crypto.randomBytes(length).toString('hex');
}

async function createUser(username, plainPassword) {
    let conn;
    try {
        // Hash the password
        const hashedPassword = await bcrypt.hash(plainPassword, 10);

        // Get a connection from the pool
        conn = await pool.getConnection();

        // Insert the user into the database
        const query = 'INSERT INTO users (username, password, created_at) VALUES (?, ?, NOW())';
        const result = await conn.query(query, [username, hashedPassword]);

        console.log(`User '${username}' created with ID:`, result.insertId);
    } catch (err) {
        console.error('Error creating user:', err);
    } finally {
        if (conn) conn.release(); // release to pool
    }
}

async function createUsers() {
    const users = [
        { username: 'Parent', password: generateRandomPassword() },
        { username: 'Lisa', password: generateRandomPassword() },
        { username: 'Anna', password: generateRandomPassword() },
        { username: 'John', password: generateRandomPassword() },
        { username: 'Mr. Beecham', password: generateRandomPassword() },
        { username: 'Mrs. Beecham', password: generateRandomPassword() }
    ];

    for (const user of users) {
        console.log(`Creating user: ${user.username}, Password: ${user.password}`);
        await createUser(user.username, user.password);
    }
}

// Create the users
createUsers();

//node create_users.js
