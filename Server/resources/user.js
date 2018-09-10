const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const connect = require('../connection/connect.js');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/:username', (req, res) => {

    res.status(200).send(inservers);
});

module.exports = router;