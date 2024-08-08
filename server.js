const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mariadb = require('mariadb');
const bcrypt = require('bcrypt');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(cors());

const pool = mariadb.createPool({
    host: '127.0.0.1',
    user: '',
    password: '',
    database: 'family_board',
    connectionLimit: 5
});

// Route to handle login requests
app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    let conn;
    try {
        conn = await pool.getConnection();
        const rows = await conn.query('SELECT * FROM users WHERE username = ?', [email]);
        if (rows.length > 0) {
            const user = rows[0];
            const isMatch = await bcrypt.compare(password, user.password);
            if (isMatch) {
                res.json({ message: 'Login successful', user: { id: user.id, username: user.username } });
            } else {
                res.status(401).json({ message: 'Invalid password' });
            }
        } else {
            res.status(404).json({ message: 'User not found' });
        }
    } catch (err) {
        res.status(500).send(err.toString());
    } finally {
        if (conn) conn.release();
    }
});

app.get('/tasks', async (req, res) => {
    let conn;
    try {
        conn = await pool.getConnection();
        const rows = await conn.query('SELECT id, type, title, details, created_by, created_at FROM tasks');
        res.json(rows);
    } catch (err) {
        res.status(500).send(err.toString());
    } finally {
        if (conn) conn.release();
    }
});

app.post('/tasks', async (req, res) => {
    const { type, title, details, created_by } = req.body;
    let conn;
    try {
        conn = await pool.getConnection();
        await conn.query('INSERT INTO tasks (type, title, details, created_by, created_at) VALUES (?, ?, ?, ?, NOW())', [type, title, details, created_by]);
        res.status(201).send('Task added');
    } catch (err) {
        res.status(500).send(err.toString());
    } finally {
        if (conn) conn.release();
    }
});

app.get('/tasks/:id', async (req, res) => {
    const { id } = req.params;
    let conn;
    try {
        conn = await pool.getConnection();
        const rows = await conn.query('SELECT * FROM tasks WHERE id = ?', [id]);
        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).send('Task not found');
        }
    } catch (err) {
        res.status(500).send(err.toString());
    } finally {
        if (conn) conn.release();
    }
});

app.put('/tasks/:id', async (req, res) => {
    const { id } = req.params;
    const { type, title, details } = req.body;
    let conn;
    try {
        conn = await pool.getConnection();
        await conn.query('UPDATE tasks SET type = ?, title = ?, details = ? WHERE id = ?', [type, title, details, id]);
        res.send('Task updated');
    } catch (err) {
        res.status(500).send(err.toString());
    } finally {
        if (conn) conn.release();
    }
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});


// Route to check for due tasks/events
app.get('/due-tasks', async (req, res) => {
    let conn;
    try {
        conn = await pool.getConnection();
        const now = new Date();
        const query = 'SELECT * FROM tasks WHERE created_at <= ?';
        const rows = await conn.query(query, [now]);
        res.json(rows);
    } catch (err) {
        res.status(500).send(err.toString());
    } finally {
        if (conn) conn.release();
    }
});
