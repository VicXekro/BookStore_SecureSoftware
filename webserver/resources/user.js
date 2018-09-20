const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const connect = require('../connection/connect');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.post('/login', (req, res) => {
    const username = req.body.username;
    const password = crypto.createCipher('aes192', req.body.password).final('hex');
    connect.querysql(`SELECT * FROM users WHERE username = ${username} AND password = ${password};`).then(result => {
        if (result[0]) res.status(200).send(result[0]);
        else res.status(200).send({ error: 'Login Failed: Username or password not found.' });
    }).catch(err => res.status(500).send({ error: err }));
});

router.post('/register', (req, res) => {
    const username = req.body.username;
    connect.querysql(`SELECT * FROM users WHERE username = ${username}`).then(result => {
        if (result[0]) res.status(200).send({ error: 'Username already taken.' });
        const password = crypto.createCipher('aes192', req.body.password);
        connect.querysql(`INSERT INTO users (username, password, phone, name, email) VALUES (${username}, ${password});`).then(() => {
            res.status(200).send({ confirm: 'Success! Registration Complete.' });
        }).catch(err => res.status(500).send({ error: err }));
    }).catch(err => res.status(500).send({ error: err }));
})

router.post('/billing', (reg, res) => {
    let address = req.body.address;
    let card = crypto.createCipher('aes192', req.body.card);
    connect.querysql(`UPDATE users SET address = ${address}, card = ${card} WHERE username = ${req.body.username}`).then(() => {
        res.status(200).send({ confirm: 'Success! Billing Information Saved.' });
    }).catch(err => res.status(500).send({ error: err }));
})

module.exports = router;
