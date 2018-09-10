const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const connect = require('../connection/connect');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/:isbn', (req, res) => {
    connect.querysql(`SELECT * FROM books WHERE ISBN = '${req.params.isbn}'`).then(result => {
        if (result[0]) res.status(200).json(result[0]);
        else return res.status(200).send('Not Found');
    }).catch(err=> {
        console.log(err.stack);
        res.status(500).send('Failed Database Query');
    })
});

router.get('/', (req, res)=>{
    console.log('recieved request');
    connect.querysql(`SELECT * FROM books`).then(result=>{
        console.log('successful database query, sending result');
        res.status(200).json(result);
        console.log('sent');
    }).catch(err=> {
        console.log(err.stack);
        res.status(500).send('Failed Database Query');
    })
})

module.exports = router;