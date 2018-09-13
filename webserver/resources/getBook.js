const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const connect = require('../connection/connect');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/', (req, res) => {
    connect.querysql(`SELECT * FROM books`).then(result => {
        res.status(200).json(result);
    }).catch(err => {
        console.log(err.stack);
        res.status(500).send('Failed Database Query');
    })
})

module.exports = router;